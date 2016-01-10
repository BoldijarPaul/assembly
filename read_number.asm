assume cs:code, ds:data
data segment      
    
	msg_newline db 10,13,'$' ; this is a \n equivalent 
	msg_enter_number db 'Your number: ','$'    
	
	var_multi db 1 ; this value we are going to multiply every time with 10
	var_index db 0 ; we are going to use this as an index                   
	var_final_result db 0
	var_read_string db 8 ; the variable in which we are going to keep the string
	var_string_length db 0 ; the variable where we are going to keep the string length
	 
	
data ends
code segment 

start:
	mov ax, data
	mov ds, ax         

                     
    ; show initial message
    mov dx,offset msg_enter_number
	call func_show_dx_and_newline 
	
	
	call func_read_number 
	; now we have the number as chars , var_read_string[1] = the length , var_read_string[2] = the actual string
	                                   
	mov al,var_read_string[1];                                   
	mov var_string_length,al ; save length in this value
	
	; iterate over the string
	mov var_index,2 ; start iterating from position 2
	
	loop_string:
	    ;check if finished iterating, index == length + 2
	    mov al,var_index
	    mov ah,var_string_length
	    add ah,2
	    cmp al,ah
	    je done_looping ; iterating is over
	    
	    mov ax,0
	    mov al,var_index
	    mov si,ax ;we have the index in si
	        
	    mov bx,0
	    mov bl,var_read_string[si]
	    push bx ; add to stack 
	    inc var_index; increment the index
	    jmp loop_string
	    
	done_looping: 
    	mov var_index,0
    	loop_stack:
    	    ; check if already read all from stack
    	    mov al,var_index
    	    mov ah,var_string_length
    	    cmp al,ah
    	    je done_looping_stack  
    	    pop ax
    	    sub al,30h  ; convert from ascii to number
    	    
    	    call func_compute_final_result
    	    call func_multiply ; find new number and multiply the multi value
    	    
    	    inc var_index ; increment index and loop again
    	    jmp loop_stack
    	    
    	    
    	     
    	    
    	    
    
    done_looping_stack:
        mov ax,4c00h
        int 21h
    
    	    
	    
	
	
	  

    ; shows on the screen the dx string
    func_show_dx proc
    	mov ah,09h
    	int 21h 
    	ret    
    	func_show_dx endp
	                 
	; does the same as above and also adds a newline              
	func_show_dx_and_newline proc
    	mov ah,09h
    	int 21h              
    	mov dx,offset msg_newline
    	call func_show_dx
    	ret    
    	func_show_dx_and_newline endp 
	
	; reads from keyboard
	func_read_number proc
    	mov ah, 0ah
    	mov dx, offset var_read_string
    	int 21h    
    	ret
    	; after reading, on the position 0 will be the max size of the string, on position 1 the actual size of the string
    	func_read_number endp
	
	; this function wil multiply the var_multi value with 10
	func_multiply proc
	    mov al,var_multi
	    mov dl,10
	    mul dl 
	    mov var_multi,al
	    ret
	    func_multiply endp
	
	; this function will do this var_final_result = var_final_result + al * var_multi
	func_compute_final_result proc
	    mov bl,var_final_result
	    mov dl,var_multi
	    mul dl
	    add bl,al
	    mov var_final_result,bl
	    ret
	    func_compute_final_result endp 
	    
	
	
	    
	
	       
code ends
end start