//! Source-safe formatting shared by every result output path.
use crate::{Atom, Error, Name, Value};
use std::collections::BTreeMap;

pub(crate) struct Record {
    pub heading: Option<String>,
    pub atom: Atom,
}

/// Short labels for the witnesses of a run, numbered in order of appearance.
#[derive(Default)]
pub(crate) struct Witnesses(BTreeMap<Name, usize>);
impl Witnesses {
    pub fn remember(&mut self, value: &Value) {
        let mut pending = vec![value];
        while let Some(value) = pending.pop() {
            match value {
                Value::Witness(name) => {
                    let next = self.0.len() + 1;
                    self.0.entry(name.clone()).or_insert(next);
                }
                Value::Compound(_, args) => pending.extend(args.iter().rev()),
                _ => {}
            }
        }
    }
    pub fn label(&self, name: &str) -> String {
        format!("w{}", self.0[name])
    }
}

fn list_items(value: &Value) -> Option<Vec<&Value>> {
    let mut items = Vec::new();
    let mut cursor = value;
    while let Value::Compound(name, args) = cursor {
        if name != "." || args.len() != 2 {
            return None;
        }
        items.push(&args[0]);
        cursor = &args[1];
    }
    (cursor == &Value::Nil).then_some(items)
}

/// A term on one line when it fits in 88 columns. Otherwise lists of plain
/// values fill lines, and other lists and terms put one item per line with
/// four-space indentation; a one-argument term keeps its argument beside it.
fn pretty(value: &Value, indent: usize, force_list: bool) -> String {
    let inline = value.to_string();
    if (!force_list || matches!(value, Value::Nil)) && indent + inline.chars().count() <= 88 {
        return inline;
    }
    let Value::Compound(name, args) = value else {
        return inline;
    };
    let padding = " ".repeat(indent + 4);
    let (open, close, items) = if let Some(items) = list_items(value) {
        if items
            .iter()
            .all(|item| !matches!(item, Value::Compound(..)))
        {
            let mut lines = vec![padding.clone()];
            for (at, item) in items.iter().enumerate() {
                let text = format!("{item}{}", if at + 1 < items.len() { "," } else { "" });
                let line = lines.last_mut().unwrap();
                if line.len() > padding.len()
                    && line.chars().count() + 1 + text.chars().count() > 88
                {
                    lines.push(format!("{padding}{text}"));
                } else {
                    if line.len() > padding.len() {
                        line.push(' ');
                    }
                    line.push_str(&text);
                }
            }
            return format!("[\n{}\n{}]", lines.join("\n"), " ".repeat(indent));
        }
        ("[".to_string(), "]", items)
    } else if name == "." && args.len() == 2 {
        return inline;
    } else if args.len() == 1 {
        let open = format!("{}(", Value::Symbol(name.clone()));
        return format!("{open}{})", pretty(&args[0], indent, false));
    } else {
        (
            format!("{}(", Value::Symbol(name.clone())),
            ")",
            args.iter().collect(),
        )
    };
    let body = items
        .iter()
        .map(|item| format!("{padding}{}", pretty(item, indent + 4, false)))
        .collect::<Vec<_>>()
        .join(",\n");
    format!("{open}\n{body}\n{}{close}", " ".repeat(indent))
}

/// Answer bindings and check summaries put one list entry per line.
fn pretty_atom(atom: &Atom) -> String {
    if atom.values.is_empty() {
        return Value::Symbol(atom.predicate.clone()).to_string();
    }
    if atom.values.len() > 1 && matches!(atom.predicate.as_str(), "answer" | "proof_check") {
        if let Some(last @ Value::Compound(..)) = atom.values.last() {
            if list_items(last).is_some() {
                let prefix = atom.values[..atom.values.len() - 1]
                    .iter()
                    .map(ToString::to_string)
                    .collect::<Vec<_>>()
                    .join(", ");
                return format!(
                    "{}({prefix}, {})",
                    Value::Symbol(atom.predicate.clone()),
                    pretty(last, 0, true)
                );
            }
        }
    }
    pretty(
        &Value::Compound(atom.predicate.clone(), atom.values.clone()),
        0,
        false,
    )
}

/// Replace witnesses by variables named after their labels.
fn open_witnesses(value: &Value, witnesses: &Witnesses, used: &mut Vec<String>) -> Value {
    match value {
        Value::Witness(name) => {
            let label = witnesses.label(name);
            if !used.contains(&label) {
                used.push(label.clone());
            }
            Value::Variable(label.to_uppercase().into())
        }
        Value::Compound(name, args) => Value::Compound(
            name.clone(),
            args.iter()
                .map(|v| open_witnesses(v, witnesses, used))
                .collect(),
        ),
        other => other.clone(),
    }
}

/// Render records as one eyepl document that parses as source. A record that
/// contains witnesses becomes a rule recreating them through `witness/2`, so
/// records that share a witness still share it after reloading.
pub(crate) fn render(records: &[Record], witnesses: &Witnesses) -> Result<String, Error> {
    let mut text = String::new();
    let mut defined = Vec::new();
    let mut last_heading = None;
    for record in records {
        // Facts of a reloaded document's own witness definitions are recreated
        // below for every witness that other records still use.
        if record.atom.predicate == "witness"
            && matches!(
                record.atom.values.as_slice(),
                [Value::Symbol(_), Value::Witness(_)]
            )
        {
            continue;
        }
        if record.heading != last_heading || text.is_empty() {
            if !text.is_empty() {
                text.push('\n');
            }
            if let Some(heading) = &record.heading {
                text.push_str(&format!("% {heading}\n"));
            }
            last_heading = record.heading.clone();
        }
        let mut used = Vec::new();
        let atom = Atom {
            predicate: record.atom.predicate.clone(),
            values: record
                .atom
                .values
                .iter()
                .map(|v| open_witnesses(v, witnesses, &mut used))
                .collect(),
        };
        text.push_str(&pretty_atom(&atom));
        if !used.is_empty() {
            let calls = used
                .iter()
                .map(|label| format!("witness({label}, {})", label.to_uppercase()))
                .collect::<Vec<_>>()
                .join(", ");
            text.push_str(&format!(" :-\n    {calls}"));
            for label in used {
                if !defined.contains(&label) {
                    defined.push(label);
                }
            }
        }
        text.push_str(".\n");
    }
    if !defined.is_empty() {
        defined.sort_by_key(|label| label[1..].parse::<usize>().unwrap_or(0));
        let definitions: String = defined
            .iter()
            .map(|label| format!("witness({label}, W) :- fresh(W).\n"))
            .collect();
        text = format!("% Witnesses\n{definitions}\n{text}");
    }
    crate::parse(&text).map_err(|e| {
        Error::new(format!(
            "Cannot emit reloadable eyepl results within the language limits: {e}"
        ))
    })?;
    Ok(text)
}
