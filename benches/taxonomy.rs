// Measure taxonomy pipeline phases separately from ordinary regression tests.
// Run scripts/bench-taxonomy on a quiet machine for comparable timings.
use eyepl::{check, parse, reason, Certificate, Limits};
use std::fs;
use std::time::{Duration, Instant};

const DEPTHS: [usize; 5] = [10, 100, 1_000, 10_000, 100_000];
fn source(depth: usize) -> String {
    fs::read_to_string(format!(
        "{}/examples/deep-taxonomy-{depth}.pl",
        env!("CARGO_MANIFEST_DIR")
    ))
    .unwrap()
}

fn median(values: impl Iterator<Item = Duration>) -> f64 {
    let mut values: Vec<_> = values.collect();
    values.sort();
    values[values.len() / 2].as_secs_f64() * 1_000.0
}

fn main() {
    let repeats = 3;
    println!("depth,input_bytes,stored_steps,matches,parse_ms,reason_ms,certificate_ms,write_ms,read_ms,check_ms,explain_ms,total_ms");
    for depth in DEPTHS {
        let text = source(depth);
        let mut samples = Vec::new();
        let mut counts = (0, 0);
        for _ in 0..repeats {
            let total = Instant::now();
            let start = Instant::now();
            let p = parse(&text).unwrap();
            let parse_time = start.elapsed();
            let start = Instant::now();
            let run = reason(&p, Limits::default()).unwrap();
            let reason_time = start.elapsed();
            counts = (run.steps.len(), run.matches);
            let start = Instant::now();
            let proof = run.certificate(&p);
            let certificate_time = start.elapsed();
            let start = Instant::now();
            let serialized = proof.to_string();
            let write_time = start.elapsed();
            let start = Instant::now();
            let restored = Certificate::parse(&serialized).unwrap();
            let read_time = start.elapsed();
            let start = Instant::now();
            let report = check(&p, &restored).unwrap();
            let check_time = start.elapsed();
            assert!(report.valid(), "{report}");
            let start = Instant::now();
            let explanation = run.proof(&p);
            let explain_time = start.elapsed();
            assert!(explanation.starts_with("eyepl-proof 1\n"));
            drop((p, run, proof, serialized, restored, report, explanation));
            samples.push([
                parse_time,
                reason_time,
                certificate_time,
                write_time,
                read_time,
                check_time,
                explain_time,
                total.elapsed(),
            ]);
        }
        print!("{depth},{},{},{}", text.len(), counts.0, counts.1);
        for phase in 0..8 {
            print!(",{:.3}", median(samples.iter().map(|s| s[phase])));
        }
        println!();
    }
}
