mov ah, 0x0e    ; Switches to teletype mode
mov al, 65      ; Moves 65 to al register, which is the capital letter A   
int 0x10        ; Calls the BIOS Interrupt, which prints out the letter

loop:           ; A loop
    inc al 
    cmp al, 'Z' + 1
    je exit
    int 0x10
    jmp loop
exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa