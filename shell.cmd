@echo off
set _ENVROOT=%~dp0
set RUSTUP_HOME=%_ENVROOT%.rustup
set CARGO_HOME=%_ENVROOT%.cargo
set V_HOME=%_ENVROOT%apps\v
set TCC_HOME=%_ENVROOT%tcc

set PATH=%CARGO_HOME%\bin;%TCC_HOME%;%V_HOME%;%PATH%

nu --env-config .config\nushell\env.nu --config .config\nushell\config.nu