use eyepl::{parse_document, reason, Error, Limits, Program, VERSION};
use std::io::{self, Read};
use std::process::ExitCode;

const HELP: &str = "eyepl — a relational rule reasoner

Usage: eyepl FILE...
       eyepl -
       eyepl -h | -v

  -h  Show this help
  -v  Show the version

The program selects the output:
  ?- Goal.         Print answers
  ?- why.          Print the preceding query's proof
  ?- check.        Check that proof with C1–C9
  ?- check(Goal).  Print whether Goal holds

The output is one eyepl document that can be reloaded as a program.
Use - for stdin. Multiple files form one program, in the supplied order.
Proof checking verifies recorded claims, not answer completeness.
";

fn read(path: &str) -> Result<String, Error> {
    if path == "-" {
        let mut text = String::new();
        io::stdin()
            .read_to_string(&mut text)
            .map_err(|error| Error::new(format!("Cannot read stdin: {error}")))?;
        Ok(text)
    } else {
        std::fs::read_to_string(path)
            .map_err(|error| Error::new(format!("Cannot read {path:?}: {error}")))
    }
}
fn run() -> Result<String, Error> {
    let mut files = Vec::new();
    let mut positional = false;
    for arg in std::env::args().skip(1) {
        if positional {
            files.push(arg);
            continue;
        }
        match arg.as_str() {
            "-h" => return Ok(HELP.into()),
            "-v" => return Ok(format!("eyepl {VERSION}\n")),
            "--" => positional = true,
            "-" => files.push(arg),
            value if value.starts_with('-') => {
                return Err(Error::new(format!("Unknown option {value:?}; use -h.")))
            }
            _ => files.push(arg),
        }
    }
    if files.is_empty() {
        return Ok(HELP.into());
    }
    if files.iter().filter(|file| file.as_str() == "-").count() > 1 {
        return Err(Error::new("Only one input may read stdin."));
    }
    let mut program = Program::default();
    for file in files {
        program.extend(
            parse_document(&read(&file)?)
                .map_err(|error| Error::new(format!("{file}: {error}")))?,
        );
    }
    reason(&program, Limits::default())?.output(&program)
}
fn main() -> ExitCode {
    match run() {
        Ok(text) => {
            print!("{text}");
            ExitCode::SUCCESS
        }
        Err(error) => {
            eprintln!("eyepl: {error}");
            ExitCode::FAILURE
        }
    }
}
