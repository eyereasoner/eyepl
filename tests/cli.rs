use eyepl::{check, parse, reason, Certificate, Condition, Limits};
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
/// Every condition is reported once; a long record wraps across lines.
fn reports_all_conditions(text: &str) {
    assert_eq!(text.matches("proof_condition(").count(), 9);
    for condition in Condition::ALL {
        assert!(
            text.contains(&format!("\"{}\"", condition.name())),
            "{condition}"
        );
    }
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
    assert!(text.starts_with(concat!(
        "% Answer 1\nmortal(socrates).\n\n",
        "% Reason 1\n",
        "proof_step(1, 1, human(socrates), source(1)).\n",
        "proof_step(1, 2, mortal(socrates), rule(1, [1])).\n",
        "proof_claim(1, answer(1, [2])).\n\n",
        "% Check 1\nproof_check(1, checked, [\n    steps(2),\n    claims(1),\n"
    )));
    assert!(text.ends_with(concat!(
        "\n% Goal check 2\ncheck_result(2, true).\n",
        "\n% Goal check 3\ncheck_result(3, false).\n"
    )));
    reports_all_conditions(&text);
    // The result document is itself an eyepl program.
    let reloaded = parse(&text).unwrap();
    assert!(reloaded.requests.is_empty());
    assert_eq!(reloaded.facts.len(), text.matches(").\n").count());
}
#[test]
fn answers_ignore_source_layout_and_number_every_query() {
    let result = cli(
        &["-"],
        "p(a). ?- % a comment\n p( X ). ?- check((p(X), X = a)).",
    );
    assert!(result.status.success());
    assert_eq!(
        String::from_utf8(result.stdout).unwrap(),
        "% Answer 1\np(a).\n\n% Goal check 2\ncheck_result(2, true).\n"
    );
}
#[test]
fn checks_do_not_replace_the_ordinary_query_and_context_crosses_files() {
    let file = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/minimal.pl");
    let result = cli(&[file, "-"], "?- check(mortal(plato)). ?- why. ?- check.");
    assert!(result.status.success());
    let text = String::from_utf8(result.stdout).unwrap();
    assert!(text.starts_with(concat!(
        "% Answer 1\nmortal(socrates).\n\n",
        "% Goal check 2\ncheck_result(2, false).\n\n",
        "% Reason 1\n"
    )));
    assert!(text.contains("proof_check(1, checked, [\n    steps(2),\n    claims(1),\n"));
    assert_eq!(text.matches("proof_claim(1, ").count(), 1);
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
    assert_eq!(result.stdout, b"% Goal check 1\ncheck_result(1, false).\n");
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
    assert!(!output.contains("not_applicable"));
    reports_all_conditions(&output);
    let source = std::fs::read_to_string(path).unwrap();
    let program = parse(&source).unwrap();
    let certificate = reason(&program, Limits::default())
        .unwrap()
        .certificate(&program);
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
