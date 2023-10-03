@echo off
set RUSTUP_HOME=%~dp0.rustup
set CARGO_HOME=%~dp0.cargo
set PATH=%CARGO_HOME%\bin;%PATH%
curl --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
