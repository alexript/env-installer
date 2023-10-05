@echo off

mkdir temp

set _ENVROOT=%~dp0
set RUSTUP_HOME=%_ENVROOT%.rustup
set CARGO_HOME=%_ENVROOT%.cargo
set V_HOME=%_ENVROOT%apps\v
set TCC_HOME=%_ENVROOT%tcc

set PATH=%CARGO_HOME%\bin;%TCC_HOME%;%V_HOME%;%_ENVROOT%temp\perl\bin;%PATH%

git submodule update --init --recursive

rem install rust
curl --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y

rem install nushell
cd %_ENVROOT%apps\nushell
cargo install --path . 

rem install v
cd %_ENVROOT%apps\v
call make.bat

rem install tcc
cd %_ENVROOT%apps\tinycc
cd win32
call build-tcc.bat -c %_ENVROOT%apps\v\thirdparty\tcc\tcc -i %_ENVROOT%\tcc
call build-tcc.bat -c %_ENVROOT%\tcc\tcc -i %_ENVROOT%\tcc
call build-tcc.bat -c %_ENVROOT%\tcc\tcc -i %_ENVROOT%\tcc

cd %_ENVROOT%

rem install wezterm (depends on perl)
curl -l https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit-PDL.zip > temp\strawberry-perl-5.32.1.1-64bit-PDL.zip
cd temp
unzip strawberry-perl-5.32.1.1-64bit-PDL.zip
cd %_ENVROOT%apps\wezterm
cargo build --all --release


rem start platform-protable setup script
cd %_ENVROOT%
nu --env-config bootstrap\nushell\env.nu --config bootstrap\nushell\config.nu setup.nu


rem cleanup bootstrap artifacts
cd %_ENVROOT%
rem rmdir %_ENVROOT%temp  /s /q
rem cd %_ENVROOT%apps\wezterm
rem cargo clean
rem cd %_ENVROOT%apps\nushell
rem cargo clean
cd %_ENVROOT%