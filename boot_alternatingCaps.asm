mov ah, 0x0e    ; Switches to teletype mode
mov al, 65      ; Moves 65 to al register, which is the capital letter A   
int 0x10        ; Calls the BIOS Interrupt, which prints out the letter

add al, 0x20

loop:               ; A loop
    inc al          ;increment al by 1
    cmp al, 'Z' + 1 ;exit loop if al is no longer an alphabet
    je exit   

    cmp al, 'z' + 1 ;exit loop if al is no longer an alphabet
    je exit       

    cmp al, 'a'     ;if al is lower case go to lower
    jge lower       

upper:
    int 0x10
    add al, 0x20    ;Add 0x20 so next iteration is for a lower case letter (difference between lower and upper case ASCII is 0x20)
    jmp loop

lower:
    int 0x10
    sub al, 0x20    ;Subtract 0x20 so next iteration is for a lower case letter (difference between lower and upper case ASCII is 0x20)
    jmp loop

exit:
    jmp $

times 510-($-$$) db 0   ;for boot sequence
db 0x55, 0xaa