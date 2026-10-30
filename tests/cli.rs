use eyepl::{check, parse, Certificate, Condition, Limits};
use std::io::Write;
use std::process::{Command, Stdio};

fn cli(args: &[&str], input: &str) -> std::process::Output {
    let mut child = Command::new(env!("CARGO_BIN_EXE_eyepl"))
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    child
        .stdin
        .take()
        .unwrap()
        .write_all(input.as_bytes())
        .unwrap();
    child.wait_with_output().unwrap()
}
fn proof(text: &str) -> Certificate {
    let start = text.find("eyepl-proof 1\n").unwrap();
    let end = text[start..]
        .find("\n?- check.")
        .map(|n| start + n)
        .unwrap_or(text.len());
    Certificate::parse(&text[start..end]).unwrap()
}
#[test]
fn source_requests_select_answers_proof_verification_and_results() {
    let source="human(socrates). mortal(P):-human(P). ?- mortal(Who). ?- why. ?- check. ?- check(mortal(socrates)). ?- check(mortal(plato)).";
    let result = cli(&["-"], source);
    assert!(
        result.status.success(),
        "{}",
        String::from_utf8_lossy(&result.stderr)
    );
    let text = String::from_utf8(result.stdout).unwrap();
    assert!(text.starts_with("?- mortal(Who).\nWho = socrates.\n\n?- why.\neyepl-proof 1\n"));
    assert!(text
        .ends_with("\n?- check(mortal(socrates)).\ntrue.\n\n?- check(mortal(plato)).\nfalse.\n"));
    let certificate = proof(&text);
    assert_eq!(certificate.steps.len(), 2);
    assert_eq!(certificate.claims.len(), 1);
    assert!(check(&parse(source).unwrap(), &certificate)
        .unwrap()
        .valid());
    for condition in Condition::ALL {
        assert!(text.contains(&format!("{condition}:")));
    }
}
#[test]
fn echoed_queries_keep_goal_structure_and_ignore_source_layout() {
    let result = cli(
        &["-"],
        "p(a). ?- % a comment\n p( X ). ?- check((p(X), X = a)).",
    );
    assert!(result.status.success());
    assert_eq!(
        String::from_utf8(result.stdout).unwrap(),
        "?- p(X).\nX = a.\n\n?- check((p(X), X = a)).\ntrue.\n"
    );
}
#[test]
fn checks_do_not_replace_the_ordinary_query_and_context_crosses_files() {
    let file = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/minimal.pl");
    let result = cli(&[file, "-"], "?- check(mortal(plato)). ?- why. ?- check.");
    assert!(result.status.success());
    let text = String::from_utf8(result.stdout).unwrap();
    assert!(
        text.starts_with("?- mortal(Who).\nWho = socrates.\n\n?- check(mortal(plato)).\nfalse.\n")
    );
    assert!(text.contains("checked: 2 steps, 1 claim"));
    assert_eq!(proof(&text).claims.len(), 1);
}
#[test]
fn only_help_and_version_options_are_available() {
    let help = String::from_utf8(cli(&["-h"], "").stdout).unwrap();
    assert!(help.contains("?- why."));
    assert!(help.contains("?- check."));
    assert!(help.contains("?- check(Goal)."));
    for removed in [
        "-e",
        "--explain",
        "-p",
        "--proof",
        "-c",
        "--prove-and-check",
        "--check-proof",
        "--max-facts",
        "--max-matches",
        "--help",
        "--version",
    ] {
        let result = cli(&[removed, "-"], "");
        assert!(!result.status.success());
        assert!(result.stdout.is_empty());
        assert!(!help.contains(removed), "obsolete option {removed} in help");
    }
    assert_eq!(
        String::from_utf8(cli(&["-v"], "").stdout).unwrap(),
        format!("eyepl {}\n", eyepl::VERSION)
    );
    assert_eq!(cli(&[], "").stdout, cli(&["-h"], "").stdout);
}
#[test]
fn malformed_input_and_missing_context_fail_without_partial_output() {
    for source in [
        "p(.",
        "?- why.",
        "?- check.",
        "p(a). ?- p(X). :- assertion(p(a)).",
    ] {
        let result = cli(&["-"], source);
        assert!(!result.status.success());
        assert!(result.stdout.is_empty());
        assert!(String::from_utf8(result.stderr)
            .unwrap()
            .starts_with("eyepl: "));
    }
    let result = cli(&["-"], "?- check(missing(X)).");
    assert!(result.status.success());
    assert_eq!(result.stdout, b"?- check(missing(X)).\nfalse.\n");
}
#[test]
fn all_nine_conditions_and_forged_certificates_still_work() {
    let path = concat!(env!("CARGO_MANIFEST_DIR"), "/examples/orders.pl");
    let result = cli(&[path], "");
    assert!(
        result.status.success(),
        "{}",
        String::from_utf8_lossy(&result.stderr)
    );
    let output = String::from_utf8(result.stdout).unwrap();
    assert!(!output.contains("not applicable"));
    for condition in Condition::ALL {
        assert!(output.contains(&format!("{condition}:")));
    }
    let source = std::fs::read_to_string(path).unwrap();
    let program = parse(&source).unwrap();
    let certificate = proof(&output);
    assert!(check(&program, &certificate).unwrap().valid());
    let forged = certificate
        .to_string()
        .replace("'>='(15, 10)", "'>='(0, 10)");
    let report = check(&program, &Certificate::parse(&forged).unwrap()).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C5).failed > 0);
    assert!(eyepl::check_with_limits(
        &program,
        &certificate,
        Limits {
            max_matches: 1,
            ..Limits::default()
        }
    )
    .is_err());
}
