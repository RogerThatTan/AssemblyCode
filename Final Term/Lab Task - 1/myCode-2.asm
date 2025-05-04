.model small
.stack 100h
.data
    sum dw 0      ; variable to store the sum
    i   dw 1      ; loop counter

.code
main:
    mov ax, @data
    mov ds, ax

loop_start:
    cmp i, 51         ; check if i <= 50
    jge done          ; if i >= 51, jump to done

    mov ax, sum       ; AX = sum
    add ax, i         ; AX = AX + i
    mov sum, ax       ; sum = AX

    inc i             ; i = i + 1
    jmp loop_start    ; repeat loop

done:
    ; Exit to DOS
    mov ax, 4C00h
    int 21h
end main
