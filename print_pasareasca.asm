.model small

.data

.code
        
 ; this program will write untill we press escape
 
read_char: ; read char and put in cl
    mov ah, 1h  ; reads char, and puts in al the value
    int 21h
    mov cl,al 
    
    ; check if char is one of: a e i o u
    ; if so, print the p, and that char
    cmp cl,'a'
    je print_p
    
    cmp cl,'e'
    je print_p
    
    cmp cl,'i'
    je print_p
    
    cmp cl,'o'
    je print_p
    
    cmp cl,'u'
    je print_p
    
    cmp cl,27 ; if escape pressed
    je exit
    
    jmp read_char ; if is not, just read again a new char   

print_p:       ; this label prints p and goes back to print the selected char
    mov dl,'p'
    mov ah,2h
    int 21h
    jmp print_cl
    
print_cl:
    mov dl,cl    
    mov ah,2h   ; print what is in dl
    int 21h
    jmp read_char



exit:
    mov ax,4c00h  ; exit to OS
    int 21h

end