@echo off
C:\Windows\System32\doskey.exe ls=eza -lah
C:\Windows\System32\doskey.exe ll=eza -lah
C:\Windows\System32\doskey.exe l=eza -lah
C:\Windows\System32\doskey.exe g=nvim $*
C:\Windows\System32\doskey.exe cp=C:\Windows\System32\xcopy.exe /E /H $*
C:\Windows\System32\doskey.exe rm=del /Q $*