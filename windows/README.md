To add this to cmd.exe startup:
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%USERPROFILE%\repo\dotfiles\windows\autostart.bat" /f

To remove it:
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f

