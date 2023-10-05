@echo off

set _ENVROOT=%~dp0
set RUSTUP_HOME=%_ENVROOT%.rustup
set CARGO_HOME=%_ENVROOT%.cargo
set V_HOME=%_ENVROOT%apps\v
set TCC_HOME=%_ENVROOT%tcc

set PATH=%CARGO_HOME%\bin;%TCC_HOME%;%V_HOME%;%PATH%

git submodule update --init --recursive

curl --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y

cd %_ENVROOT%apps\nushell
cargo install --path . 
rem cargo clean

cd %_ENVROOT%apps\v
call make.bat

cd %_ENVROOT%apps\tinycc
cd win32
call build-tcc.bat -c %_ENVROOT%apps\v\thirdparty\tcc\tcc -i %_ENVROOT%\tcc
call build-tcc.bat -c %_ENVROOT%\tcc\tcc -i %_ENVROOT%\tcc
call build-tcc.bat -c %_ENVROOT%\tcc\tcc -i %_ENVROOT%\tcc


cd %_ENVROOT%
nu --env-config bootstrap\nushell\env.nu --config bootstrap\nushell\config.nu setup.nu