section .bss
    tmp resd 1 
    tmp1 resd 1
section .data
    a dd 14
section .rodata

section .text
global f3, f1, f2, f5, f4
;;;;;lnx
f1:
    push ebp
    mov ebp, esp
    finit
    fld1
    fld dword[ebp + 8]
    FYL2X
    fstp dword[tmp]
    fld dword[tmp]
    FLDL2E
    FDIV
    leave 
    xor eax, eax
    ret

;−2x + 14
f2:
    PUSH EBP
    MOV EBP, ESP
    finit
    mov dword[tmp], -2
    fild dword[tmp] ;-2
    fld dword[ebp + 8] ;x
    fmul ;x*(-2)
    mov dword[tmp], 14 
    fild dword[tmp] ;14
    fadd ;+14
    leave 
    RET
;;;;; 1/(2 − x)+6
f3:
    PUSH EBP
    MOV EBP, ESP
    finit
    mov dword[tmp], 2
    fild dword[tmp];2
    fld dword[ebp + 8];x
    fsub ;x - 2
    fstp dword[tmp] ; x= x-2
    fld1
    fld dword[tmp]
    fdiv
    mov dword[tmp], 6
    fild dword[tmp] ; 6
    fadd
    MOV ESP, EBP
    POP EBP
    RET
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;  1/(2 − x)+6
f4:
    PUSH EBP
    MOV EBP, ESP
    finit
    mov dword[tmp], 4
    fld dword[ebp + 8];x
    fild dword[tmp];4
    fsub ;x - 4
    fstp dword[tmp] ; x= x-4
    mov dword[tmp1], 3
    fild dword[tmp1];3
    fld dword[tmp]
    fdiv
    mov dword[tmp], 4
    fild dword[tmp] ; 4
    fadd
    MOV ESP, EBP
    POP EBP
    RET
;;;;;;;;;;;;;;;;;;;;;;;;;
f5:
    PUSH EBP
    MOV EBP, ESP
    finit
    mov dword[tmp], 3
    fild dword[tmp];3
    fld dword[ebp + 8];x
    fdiv
    MOV ESP, EBP
    POP EBP
    RET

