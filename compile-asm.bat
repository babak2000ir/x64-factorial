REM ASSEMBLY EXE/DLL

REM Debug - Compile asm-factorial-dll:
nasm -f win64 -l %debugp%\factorial.lst -gcv8 -o %debugp%\factorial.obj src\asm-factorial-dll\factorial.asm

REM Release - Compile asm-factorial-dll:
nasm -f win64 -l %releasep%\factorial.lst -o %releasep%\factorial.obj src\asm-factorial-dll\factorial.asm 

REM Debug - Link asm-factorial-exe:
link %debugp%\factorial.obj %libs% /nologo /incremental:no /subsystem:console /entry:main /opt:noref /debug /pdb:%debugp%\factorial-asm.pdb /out:%debugp%\factorial-asm.exe 

REM Release - Link asm-factorial-exe:
link %releasep%\factorial.obj %libs% /nologo /incremental:no /subsystem:console /entry:main /opt:ref /out:%releasep%\factorial-asm.exe 

REM debug - Link asm-factorial-dll:
link %debugp%\factorial.obj /dll %libs% /nologo /incremental:no /opt:ref /export:factorial /out:%debugp%\factorial.dll 

REM release - Link asm-factorial-dll:
link %releasep%\factorial.obj /dll %libs% /nologo /incremental:no /opt:ref /export:factorial /out:%releasep%\factorial.dll 