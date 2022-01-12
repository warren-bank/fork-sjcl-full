@echo off

rem :: remove old files
call :rm "config.mk"
call :rm "sjcl.js"

rem :: add needed tools to PATH
set PERL_HOME=C:\PortableApps\perl\5.10.1
set MAKE_HOME=C:\PortableApps\make
set PATH=%PERL_HOME%;%MAKE_HOME%;%PATH%

cd "%~dp0.."
perl "configure" --with-all --compress=none
make all

goto :done

:rm
  set fpath="%~dp0..\%~1"
  if exist %fpath% del /Q %fpath%
  goto :eof

:done
echo.
pause
