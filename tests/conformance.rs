//! File-based checks of ISO compatibility and extended Datalog restrictions.
use std::collections::BTreeSet;
use std::fs;
use std::path::{Path, PathBuf};
use wheye::{check, parse, reason, Certificate, Limits, Request};

fn directory(group: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/conformance")
        .join(group)
}

fn sources(group: &str, expected_extension: &str) -> Vec<PathBuf> {
    let mut sources = Vec::new();
    let mut expectations = BTreeSet::new();
    for entry in fs::read_dir(directory(group)).unwrap() {
        let path = entry.unwrap().path();
        match path.extension().and_then(|extension| extension.to_str()) {
            Some("pl") => sources.push(path),
            Some(extension) if extension == expected_extension => {
                expectations.insert(path.with_extension("pl"));
            }
            _ => panic!("Unexpected conformance fixture: {}", path.display()),
        }
    }
    sources.sort();
    assert!(!sources.is_empty(), "Empty conformance group: {group}");
    assert_eq!(
        sources.iter().cloned().collect::<BTreeSet<_>>(),
        expectations,
        "Missing or orphaned expectations in {group}"
    );
    sources
}

fn answers(path: &Path) -> Result<usize, String> {
    let source = fs::read_to_string(path).map_err(|error| error.to_string())?;
    let program = parse(&source).map_err(|error| format!("parse: {error}"))?;
    if program.queries.is_empty()
        || program
            .requests
            .iter()
            .any(|request| !matches!(request, Request::Answer(_)))
    {
        return Err("Answer fixtures must contain ordinary queries only.".into());
    }
    let expected =
        fs::read_to_string(path.with_extension("answers")).map_err(|error| error.to_string())?;
    let expected: Vec<_> = expected.lines().collect();
    if expected.len() != program.queries.len() {
        return Err(format!(
            "{} expected rows for {} queries",
            expected.len(),
            program.queries.len()
        ));
    }
    let run = reason(&program, Limits::default()).map_err(|error| format!("reason: {error}"))?;
    for (index, query) in program.queries.iter().enumerate() {
        let mut rows: Vec<_> = run.answers[index]
            .iter()
            .map(|answer| {
                if answer.values.is_empty() {
                    "true".to_owned()
                } else {
                    query
                        .variables
                        .iter()
                        .zip(&answer.values)
                        .map(|(variable, value)| format!("{variable} = {value}"))
                        .collect::<Vec<_>>()
                        .join(", ")
                }
            })
            .collect();
        // Ignore answer order, but retain multiplicity so duplicates fail.
        rows.sort();
        let actual = if rows.is_empty() {
            "false".to_owned()
        } else {
            rows.join("; ")
        };
        if actual != expected[index] {
            return Err(format!(
                "query {}: expected {:?}, got {:?}",
                index + 1,
                expected[index],
                actual
            ));
        }
    }
    let certificate = run.certificate(&program);
    let saved = Certificate::parse(&certificate.to_string())
        .map_err(|error| format!("certificate parse: {error}"))?;
    if saved != certificate {
        return Err("Certificate round trip changed the evidence.".into());
    }
    check(&program, &saved)
        .and_then(|report| report.require_valid())
        .map_err(|error| format!("certificate check: {error}"))?;
    Ok(program.queries.len())
}

fn error(path: &Path) -> Result<usize, String> {
    let source = fs::read_to_string(path).map_err(|error| error.to_string())?;
    let expected =
        fs::read_to_string(path.with_extension("error")).map_err(|error| error.to_string())?;
    let actual = match parse(&source) {
        Err(error) => format!("parse: {error}\n"),
        Ok(program) => match reason(&program, Limits::default()) {
            Err(error) => format!("reason: {error}\n"),
            Ok(_) => return Err("Expected an error, but execution succeeded.".into()),
        },
    };
    if actual != expected {
        return Err(format!("expected {expected:?}, got {actual:?}"));
    }
    Ok(1)
}

fn verify(group: &str, extension: &str, verify: fn(&Path) -> Result<usize, String>) {
    let paths = sources(group, extension);
    let mut failures = Vec::new();
    let mut cases = 0;
    for path in &paths {
        match verify(path) {
            Ok(count) => {
                cases += count;
                println!(
                    "{group}/{}: PASS ({count} cases)",
                    path.file_stem().unwrap().to_string_lossy()
                );
            }
            Err(error) => {
                failures.push(format!("{}: {error}", path.display()));
            }
        }
    }
    println!(
        "{group}: {} fixtures, {cases} passing cases, {} failures",
        paths.len(),
        failures.len()
    );
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

#[test]
fn iso_subset_answers_and_certificates() {
    verify("iso", "answers", answers);
}

#[test]
fn iso_error_conditions_use_specific_wheye_diagnostics() {
    verify("errors", "error", error);
}

#[test]
fn unsupported_modes_and_syntax_are_rejected() {
    verify("unsupported", "error", error);
}
