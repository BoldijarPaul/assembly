
; Copy string s='abcd' into string d

assume cs:code, ds:data

data segment
    
    a db 'abcd$'
    len equ $-a  ; the length of the array
    d db len dup (?) ; the new array

data ends


code segment
start:
             
    mov ax,data ; add data to data segment
    mov ds,ax 
    
    mov si,offset a ; put the 1st index of si
    mov cx,len ; length of the sir  
               ; loop will decrement the cx
               ; each step
    
          
    
    repeat:
        mov ah,byte ptr a + si  ; we get the array element
        mov d[si],ah ; set the new array
        inc si  ; increment the index
        
        loop repeat ; loop
        
    
    mov ax,4c00h
    int 21h 
    
    code ends

end start