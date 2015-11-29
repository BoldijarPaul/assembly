.model small

.data
.code
    
    main proc 
   
    mov cl, 64 ; keep the value in cl register 
    jmp add_value ; jump to add_value label
    
    
    add_value:
        add cl,1 ; increment cl by 1
        cmp cl,65 + 26 ; compare the number 
        
        je finish; if cl is 65+26 it will jump to finish
        
        jmp print; else it will jump to print
       
    finish:
        mov ax,4c00h   ;this will return to the OS
        int 21h      
        
    print:
        mov dl,cl ; we want to print a character, so we put in dl what we want
        mov ah, 2h ; the 2h is what we need to print a char
        int 21h   ; execute the command
        jmp add_value  ; increment the cl register
    
    endp
    end main
    