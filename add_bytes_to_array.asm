   ;9. Se da un sir de octeti S. Sa se construiasca un sir D1 
;care sa contina toate numerele ;pozitive si un sir D2 
;care sa contina toate numerele negative din S.
;Exemplu:
;S: 1, 3, -2, -5, 3, -8, 5, 0
;D1: 1, 3, 3, 5, 0
;D2: -2, -5, -8

assume cs:code, ds: data
data segment
	
    sir db 100 dup (?)   ; declar array of length 100, of bytes

data ends
code segment
start:
	mov ax,data
	mov ds,ax
    
    mov cl,0 ; in cl we are going to keep the value that we will add (8 biti)
    mov di,0 ; in di we hold the array index , start from 0
    tag: 
    mov sir[di],cl  ; add to the array at position di, the cl value
    inc cl    
    inc di ; increment the value and index
    jmp tag   ; we go back to the tag, it will be infinite loop
	
	mov ax, 4c00h
	int 21h
code ends
end start	