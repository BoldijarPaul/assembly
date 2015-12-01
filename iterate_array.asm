assume cs:code, ds:data

data segment
    
    sir db 1,2,3,4,5,6,7,8,9,0,1,2,3,4
    len equ $-sir  ; the length of the array

data ends


code segment
start:
             
    mov ax,data ; add data to data segment
    mov ds,ax 
    
    mov si,offset sir ; put the 1st index of si
    mov cx,len ; length of the sir  
               ; loop will decrement the cx
               ; each step
    
          
    
    repeat:
        mov dl,sir[si]  ; we get the array element
                        ; like this
        inc si  ; increment the index
                  
        add dl,48  ; we already put in dl, now display
                   ; add 48 to make it ascii number
        mov ah,2h
        int 21h
        
        loop repeat ; loop
        
    
    mov ax,4c00h
    int 21h 
    
    code ends

end start