REM C Calling ASSEMBLY EXE

REM Debug - Compile & Link c-test-asm-factorial-exe:
cl /Fo%debugp%/ /Fa%debugp%/ src\c-test-asm-factorial\factorial_asm_caller.c %debugp%\factorial.lib /Ox /link /subsystem:console /entry:main /incremental:no /machine:x64 /nologo %libs% /opt:ref /out:"%debugp%\factorial_asm_caller.exe"

REM Release - Compile & Link c-test-asm-factorial-exe:
cl /Fo%releasep%/ src\c-test-asm-factorial\factorial_asm_caller.c %releasep%\factorial.lib /Ox /link /subsystem:console /entry:main /incremental:no /machine:x64 /nologo %libs% /opt:ref /out:"%releasep%\factorial_asm_caller.exe"

REM C Factorial EXE

REM Debug - Compile & Link c-test-factorial-exe:
cl /Fo%debugp%/ /Fa%debugp%/ src\c-test-factorial\factorial_c.c %debugp%\factorial.lib /Ox /link /subsystem:console /entry:main /incremental:no /machine:x64 /nologo %libs% /opt:ref /out:"%debugp%\factorial_c.exe"

REM Release - Compile & Link c-test-factorial-exe:
cl /Fo%releasep%/ src\c-test-factorial\factorial_c.c %releasep%\factorial.lib /Ox /link /subsystem:console /entry:main /incremental:no /machine:x64 /nologo %libs% /opt:ref /out:"%releasep%\factorial_c.exe"