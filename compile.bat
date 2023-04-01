@echo off

set debugp=.\obj\debug
set releasep=.\obj\release
set libs=/defaultlib:ucrt.lib /defaultlib:msvcrt.lib /defaultlib:legacy_stdio_definitions.lib /defaultlib:Kernel32.lib /defaultlib:Shell32.lib

del /f /q %debugp%\*.*
del /f /q %releasep%\*.*

call compile-asm.bat
call compile-c.bat