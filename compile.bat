@echo off
del *.obj
del *.exe
del *.lst
del *.pdb

nasm -f win64 -l factorial.lst -gcv8 -o factorial.obj factorial.asm

REM Release:
REM nasm -f win64 -l factorial.lst -o factorial.obj factorial.asm 

REM Debug:
REM link factorial.obj /defaultlib:ucrt.lib /defaultlib:msvcrt.lib /defaultlib:legacy_stdio_definitions.lib /defaultlib:Kernel32.lib /defaultlib:Shell32.lib /nologo /incremental:no /subsystem:console /entry:main /opt:noref /debug /pdb:"factorial.pdb" /out:factorial.exe 

REM Release:
REM link factorial.obj /defaultlib:ucrt.lib /defaultlib:msvcrt.lib /defaultlib:legacy_stdio_definitions.lib /defaultlib:Kernel32.lib /defaultlib:Shell32.lib /nologo /incremental:no /subsystem:console /entry:main /opt:ref /out:factorial.exe 

REM DLL:
link factorial.obj /dll /defaultlib:ucrt.lib /defaultlib:msvcrt.lib /defaultlib:legacy_stdio_definitions.lib /defaultlib:Kernel32.lib /defaultlib:Shell32.lib /nologo /incremental:no /opt:ref /export:factorial /out:factorial.dll 

REM Compile and Link C code:
cl .\c-code-test\factorial_test.c factorial.lib /Ox /link /subsystem:console /entry:main /incremental:no /machine:x64 /nologo /defaultlib:Kernel32.lib /defaultlib:User32.lib /defaultlib:ucrt.lib /defaultlib:msvcrt.lib /opt:ref 
