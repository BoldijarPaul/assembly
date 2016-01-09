
; Merge strings a='abcde' and b='12345' into d (d='a1b2c3d4e5')

assume cs:code, ds:data

data segment
     
    
    a db 'abcde$'
    alen equ $-a  ; the length of the array
    b db '12345$'
    blen equ $-b;
    d db alen+blen dup (?) ; the new array
    dlen db alen+blen

data ends


code segment
start:
             
    mov ax,data ; add data to data segment
    mov ds,ax 
    
    mov si,offset a ; put the 1st index of si
    mov di ,0; index of d 
          
    mov ch,0
    mov cl,dlen ; length of the sir  
               ; loop will decrement the cx
               ; each step 
    
    
          
    
    repeat:
        mov ah,byte ptr a + si  ; we get the array element        
        mov d[di],ah
        inc di
        
        mov ah,byte ptr b + si  ; we get the array element                
        mov d[di],ah        
        inc di      
        
        inc si  ; increment the index
        
        loop repeat ; loop
        
    
    mov ax,4c00h
    int 21h 
    
    code ends

end start