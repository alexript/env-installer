@echo off
set RUSTUP_HOME=%~dp0.rustup
set CARGO_HOME=%~dp0.cargo
set V_HOME=%~dp0apps\v

set PATH=%CARGO_HOME%\bin;%V_HOME%;%PATH%


nu --env-config .config\nushell\env.nu --config .config\nushell\config.nu