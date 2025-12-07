%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .text
global _start

f_calc:
    add eax, 2      ; x + 2
    imul eax, 5     ; (x + 2) * 5
    ret

; --- Основная программа ---
_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0
next:
    cmp ecx, 0h
    jz _end
    pop eax
    call atoi 
    call f_calc
    add esi, eax
    loop next
_end:
    mov eax, msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit