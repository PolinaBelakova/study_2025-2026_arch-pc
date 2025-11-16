;--------------------------------
; Программа вычисления выражения 5(x+18)-28
;--------------------------------
%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, eax=x
add eax,18    ; eax = x + 18
mov ebx,5     ; 
imul ebx      ; eax = 5*(x+18)
sub eax,28    ; eax = 5*(x+18)-28

mov edi,eax

mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit