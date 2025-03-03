ORG 0x7c00
BITS 16

start:
    mov si, message
    call print
    jmp $

print:
    mov bx, 0
.loop:
    lodsb
    cmp al,  0
    je .done
    call print_char
    jmp .loop
.done:
    ret
print_char:
    mov ah, 0Eh

    int 0x10
    ret

message: db `it is time to BUILD`, 0

times 510-($-$$)   db 0;
dw 0xAA55
