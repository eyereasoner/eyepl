use eyepl::{check, parse, reason, Certificate, Limits, Request};
use std::collections::BTreeSet;
use std::fs;
use std::path::Path;
use std::time::Instant;

fn verify(path: &Path, update: bool) -> Result<(), Box<dyn std::error::Error>> {
    let source = fs::read_to_string(path)?;
    let program = parse(&source)?;
    let run = reason(&program, Limits::default())?;
    for request in &program.requests {
        if let Request::Result(index) = request {
            if run.answers[*index].is_empty() {
                return Err(format!("goal check {} returned false", index + 1).into());
            }
        }
    }
    let certificate = run.certificate(&program);
    if certificate.claims.is_empty() {
        return Err("the bundled example exported no answer claims".into());
    }
    let saved = Certificate::parse(&certificate.to_string())?;
    if saved != certificate {
        return Err("certificate round trip changed the evidence".into());
    }
    check(&program, &saved)?.require_valid()?;
    let output = run.output(&program)?;
    let golden = path
        .parent()
        .unwrap()
        .join("output")
        .join(path.file_stem().unwrap())
        .with_extension("txt");
    if update {
        fs::write(golden, output)?;
    } else {
        let expected = fs::read_to_string(&golden)?;
        if output != expected {
            let line = output
                .lines()
                .zip(expected.lines())
                .position(|(a, b)| a != b)
                .unwrap_or_else(|| output.lines().count().min(expected.lines().count()));
            let actual = output.lines().nth(line).unwrap_or("<end of output>");
            let wanted = expected.lines().nth(line).unwrap_or("<end of golden>");
            return Err(format!(
                "{} differs at line {}\nexpected: {}\nactual:   {}",
                golden.display(),
                line + 1,
                wanted.chars().take(240).collect::<String>(),
                actual.chars().take(240).collect::<String>()
            )
            .into());
        }
    }
    Ok(())
}

#[test]
fn all_examples_match_goldens_and_pass_c1_c9() {
    let directory = Path::new(env!("CARGO_MANIFEST_DIR")).join("examples");
    let mut paths: Vec<_> = fs::read_dir(&directory)
        .unwrap()
        .map(|entry| entry.unwrap().path())
        .filter(|path| path.extension().is_some_and(|extension| extension == "pl"))
        .collect();
    paths.sort();
    assert!(paths.len() >= 91);
    let update = std::env::var("EYEPL_UPDATE_GOLDENS").as_deref() == Ok("1");
    let mut failures = Vec::new();
    for path in &paths {
        let started = Instant::now();
        let result = verify(path, update);
        println!(
            "Example {}: {} · {:.3} s · golden + C1–C9",
            path.file_name().unwrap().to_string_lossy(),
            if result.is_ok() { "PASS" } else { "FAIL" },
            started.elapsed().as_secs_f64()
        );
        if let Err(error) = result {
            failures.push(format!("{}: {error}", path.display()));
        }
    }
    let names: BTreeSet<_> = paths
        .iter()
        .map(|path| path.file_stem().unwrap().to_owned())
        .collect();
    let goldens: BTreeSet<_> = fs::read_dir(directory.join("output"))
        .unwrap()
        .map(|entry| entry.unwrap().path())
        .filter(|path| path.extension().is_some_and(|extension| extension == "txt"))
        .map(|path| path.file_stem().unwrap().to_owned())
        .collect();
    if goldens != names {
        failures.push(format!(
            "golden coverage: missing {:?}; unexpected {:?}",
            names.difference(&goldens).collect::<Vec<_>>(),
            goldens.difference(&names).collect::<Vec<_>>()
        ));
    }
    assert!(
        failures.is_empty(),
        "Example verification failed:\n{}",
        failures.join("\n")
    );
}
