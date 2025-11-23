%include 'in_out.asm'
section .data
msg db "Наименьшее число: ",0h
A dd 41
B dd 62
C dd 35
section .bss
min resb 10
section .text
global _start
_start:
; --- Записываем 'А' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'

; --- Сравниваем 'А' и 'B'
cmp ecx,[B] ; Сравниваем 'А' и 'B'
jl compare_AC ; если 'А<B', то переход на метку 'compare_AC',
mov ecx,[B] ; иначе 'ecx = B'
mov [min],ecx ; 'min = B'

; --- Сравниваем 'min(A,B)' и 'C'
compare_AC:
mov ecx,[min]
cmp ecx,[C] ; Сравниваем 'min(A,B)' и 'C'
jl fin ; если 'min(A,B)<C', то переход на 'fin',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'

; --- Вывод результата
fin:
mov eax, msg
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход