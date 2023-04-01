default rel
bits 64

segment .data
    fmt db "factorial is: %d", 0xd, 0xa, 0

segment .text

global main
global factorial

extern _CRT_INIT
extern ExitProcess
extern printf

factorial:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    test    ecx, ecx   ; if (n == 0) return 1; ecx = n, first integer argument
    jz      .zero

    mov    ebx, 1       ; counter c
    mov    eax, 1       ; result

    inc    ecx

.for_loop:
    cmp    ebx, ecx
    je     .end_loop

    mul    ebx          ; multiply ebx * eax and store in eax

    inc    ebx          ; ++c
    jmp    .for_loop

.zero:
    mov    eax, 1     ; return 1; eax = return value

.end_loop:
    leave
    ret

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    call    _CRT_INIT

    mov     rcx, 10      ; n = 5
    call    factorial

    lea     rcx, [fmt]   ; *fmt -> "factorial is: %d"
    mov     rdx, rax    ; rax = factorial(5)
    call    printf      ; printf(*fmt, rax);

    xor     rax, rax
    call    ExitProcess