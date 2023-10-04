@echo off
set RUSTUP_HOME=%~dp0.rustup
set CARGO_HOME=%~dp0.cargo
set PATH=%CARGO_HOME%\bin;%PATH%

nu --env-config .config\nushell\env.nu --config .config\nushell\config.nu