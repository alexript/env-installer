@echo off
set RUSTUP_HOME=%~dp0.rustup
set CARGO_HOME=%~dp0.cargo
set V_HOME=%~dp0apps\v

set PATH=%CARGO_HOME%\bin;%V_HOME%;%PATH%

git submodule update --init --recursive

curl --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y

cd apps\nushell
cargo install --path . 
rem cargo clean
cd ..\..

cd apps\v
make.bat
cd ..

nu --env-config bootstrap\nushell\env.nu --config bootstrap\nushell\config.nu setup.nu