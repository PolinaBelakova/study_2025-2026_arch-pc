%include 'in_out.asm'
section .data
    msg_x db 'Введите x: ', 0h
    msg_a db 'Введите a: ', 0h
    msg_result db 'Результат f(x): ', 0h
section .bss
    x resb 10
    a resb 10
    result resb 10
section .text
global _start
_start:
    ; Ввод значения x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    ; Ввод значения a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    ; Преобразование x и a из строк в числа
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, a
    call atoi
    mov [a], eax
    ; --- Вычисление функции f(x) --
    mov ebx, [x]      ; ebx = x
    mov ecx, [a]      ; ecx = a
    ; Сравниваем x с 2
    cmp ebx, 2
    jg case_x_greater_2  ; если x > 2, переход к case_x_greater_2
    ; Случай x ≤ 2: f(x) = 3a
case_x_less_equal_2:
    mov eax, ecx      ; eax = a
    imul eax, 3       ; eax = 3 * a
    mov [result], eax
    jmp output_result
     ; Случай x > 2: f(x) = x - 2
    case_x_greater_2:
    mov eax, ebx      ; eax = x
    sub eax, 2        ; eax = x - 2
    mov [result], eax
    output_result:
    ; Вывод результата
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF

    call quit