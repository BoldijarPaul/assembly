;3. Se da un sir de dublucuvinte.
;Sa se ordoneze descrescator sirul cuvintelor inferioare ale acestor dublucuvinte.
;Cuvintele superioare raman neschimbate.
;Ex: dandu-se: sir DD 12345678h, 1256ABCDh, 12AB4344h 
;rezultatul va fi 1234ABCDh, 12565678h, 12AB4344h . 

ASSUME cs:code, ds:data

data SEGMENT
 sir DD 12345678h , 1256ABCDh , 12AB4344h
 l EQU ($-sir) /4 ;lugimea sirului exprimata in dublucuvinte
 sir2 dw l DUP(?) ;va contine cuvintele inferioare din dublucuvinte in scopul sortarii lor
data ends
 
file_name db 'output.txt',0
file_name_length equ $-file_name

file_content db 'this is a sample for writing in files',0
file_content_length equ $-file_content

code SEGMENT
start:
    mov ax,data
    mov ds,ax
                 
    ; make null after last char
    mov si,file_name_length
    ;mov file_name[si],0    
    
    ; create file
    mov cx,0 ; normal atribute
    mov dx,offset file_name
    call func_create_read ; after this, in ax will be stored the file handle
    
    ; make null after last char
    mov si,file_content_length
    ;mov file_content[si],0
    
    ; write in file
    mov bx,ax ; put handle in bx
    mov cx,file_content_length
    mov dx,offset file_content
    call func_write
     
    ; done, end program
    call func_end
    
      
    
    
        
    
    func_write proc
        mov ah,40h
        int 21h
        jc func_write_error
        ret
        func_write_error:
            call func_end
        ret
        func_write endp
    
    func_create_read proc
        mov ah,3ch
        int 21h
        jc func_create_read_error
        ret
        func_create_read_error:
            call func_end
        ret
        func_create_read endp
        
        
    
    func_end proc 
        mov ax,4c00h
        int 21h
        ret
        func_end endp
          
      

code ENDS
END start