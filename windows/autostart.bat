REM to add this to cmd.exe startup
REM reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%USERPROFILE%\repo\dotfiles\windows\autostart.bat" /f

REM to remove it
REM reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f


@echo off
C:\Windows\System32\doskey.exe ls=eza -lah
C:\Windows\System32\doskey.exe ll=eza -lah
C:\Windows\System32\doskey.exe l=eza -lah
C:\Windows\System32\doskey.exe g=nvim $*
C:\Windows\System32\doskey.exe cp=C:\Windows\System32\xcopy.exe /E /H $*
C:\Windows\System32\doskey.exe rm=del /Q $*