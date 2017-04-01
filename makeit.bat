@echo off

    if exist "game.obj" del "game.obj"
    if exist "game.exe" del "game.exe"

    \masm32\bin\ml /c /coff "game.asm"
    if errorlevel 1 goto errasm

    \masm32\bin\PoLink /SUBSYSTEM:CONSOLE "game.obj"
    if errorlevel 1 goto errlink
    dir "game.*"
    goto TheEnd

  :errlink
    echo _
    echo Link error
    goto TheEnd

  :errasm
    echo _
    echo Assembly Error
    goto TheEnd
    
  :TheEnd

pause
