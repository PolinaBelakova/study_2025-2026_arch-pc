%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
result: DB 'f(g(x))=2*(3x-1)+7=',0
SECTION .bss
x: RESB 80
res: RESB 80
SECTION .text
GLOBAL _start
_start:
; Основная программа
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
call _calcul ; Вызов подпрограммы _calcul
mov eax,result
call sprint
mov eax,[res]
call iprintLF
call quit
_calcul:
push eax 
call _subcalcul
mov ebx, 2 ; f(x) = 2x+7
mul ebx ; 2 * g(x)
add eax, 7 ; 2*g(x) + 7
mov [res], eax ; Сохраняем результат
pop eax
ret 
_subcalcul:
mov ebx, 3
mul ebx ; 3*x
sub eax, 1 ; 3x-1
ret 