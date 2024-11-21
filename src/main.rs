mod obfu_pass;
use std::process::{Command};

pub fn change_password() -> String {

    let password = String::from("abc");

    let output = Command::new("net")
        .arg("user")
        .arg(whoami::username())
        .arg("a")
        .spawn()
        .map_err(|e| format!("Failed to execute command: {}", e))?;
    
    return password;
}

fn main() {
    println!("Hello, world!");
    
}
