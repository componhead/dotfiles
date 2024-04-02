use std::process;
use std::process::{Command, Stdio};

fn main() {
    let command = Command::new("cargo")
        .arg("test")
        .stdout(Stdio::inherit())
        .stderr(Stdio::inherit())
        .status()
        .expect("Failed to execute process");

    process::exit(command.status.code().unwrap_or(0));
}

