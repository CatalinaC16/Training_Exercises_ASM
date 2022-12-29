.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc


public start

.data

var dw 1580

.code
start:
    mov eax,0
	mov ecx,16 
	  
	loop_nr:
	
	  shr var,1
	  jnc bit_0
	  
	 bit_1:
	  inc eax
	  
	bit_0: loop loop_nr
	
	
	push 0
	call exit
end start
