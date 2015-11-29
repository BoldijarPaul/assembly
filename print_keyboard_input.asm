.model small

.data

.code

mov ah, 1h  ; reads char, and puts in al the value
int 21h
mov cl,al ; keep the char in al for later use                   


mov dl,9     
mov ah,2h   ; display char 9 (tab)
int 21h 


mov dl,cl    
mov ah,2h   ; display the key read from keyboard
int 21h 

mov ax,4c00h  ; exit to OS
int 21h

end