.model small

.data

    message db "Enter a number $"
    message2 db " Enter another number $"
    message3 db " + $"
    message4 db " = $"
    

.code
    main proc
        
        mov ax,seg message ; we put the adress of the message in ax
        mov ds,ax
        mov dx,offset message ; we put the offset of message in dx
        mov ah,9h ; we put in ah the write string value
        int 21h
        
        
        mov ah,1h  ; input stored in al
        int 21h
        mov bl,al    ; move to bl
        
        
        mov ax,seg message2 ; we put the adress of the message in ax
        mov ds,ax
        mov dx,offset message2 ; we put the offset of message in dx
        mov ah,9h ; we put in ah the write string value
        int 21h
        
        
        mov ah,1h  ; input stored in al
        int 21h
        mov cl,al    ; move to cl
        
           
        mov dl,' '
        mov ah,2h ; print space
        int 21h   
           
           
        mov dl,bl
        mov ah,2h ; 2h prints what is in dl
        int 21h
        
        mov ax,seg message3 ; print ' + '
        mov ds,ax
        mov dx,offset message3 
        mov ah,9h ; 
        int 21h
        
        mov dl,cl
        mov ah,2h ; 2h prints what is in dl
        int 21h    
        
        mov ax,seg message4 ; print ' + '
        mov ds,ax
        mov dx,offset message4 
        mov ah,9h ; 
        int 21h
        
        sub bl,48       ; convert from ascii to decimal, and back
        sub cl,48
        add bl,cl
        add bl,48
        
        mov dl,bl
        mov ah,2h ; 2h prints what is in dl
        int 21h
        
        
        
        
    
    
    mov ax,4c00h
    int 33    
    endp
    
end main