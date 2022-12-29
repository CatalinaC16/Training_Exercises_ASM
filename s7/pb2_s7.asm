.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
public start

.data

a dd 24
b dd 5
nr dd 0 ;in nr avem numarul pe care vrem sa il testam daca e prim
format db "%d",0
text db "introdu un nr pe care sa il testezi daca este prim si enter ",0
da db "este prim",0
nu db "nu e prim",0

.code

print macro n
	push n
	push offset format
	call printf
	add esp, 8
	
endm

nr_divizibile proc 

  push ebp
  mov ebp,esp
  
  mov eax,ecx
  mov ecx,edx
  xor edx,edx
 
  div ecx
  test edx,edx
  mov eax,edx
  
  pop ebp
  
 ret

nr_divizibile endp 
 
prim proc

 
  push ebp
  mov ebp,esp
  
   xor eax,eax
   xor edx,edx
   
   mov eax,nr
   mov ebx,2
   div ebx
   mov ecx, eax
   inc ecx
 
    
   parcurgere:
     dec ecx
     xor edx,edx
	 
	 mov edx,ecx
     mov ecx,nr
	 call nr_divizibile
	 ;cele 2 sunt divizibile=>nu e prim, are divizori
     cmp eax,0
	 je stop_NUprim
	 
 
 cmp ecx,2
 jg parcurgere
 
  stop_prim:
   pop ebp
   ret
  stop_NUprim : 
   mov eax,0
   
   pop ebp
   ret
prim endp



start:
   ; mov ecx, a
    ;mov edx, b
   ; call nr_divizibile
   ; print eax
 
   push offset text
   call printf
   add esp,4
 
   push offset nr
   push offset format 
   call scanf
   add esp,8
 
    xor eax,eax
	
    push nr
    call prim
	;cmp eax,1
	;print eax
	;add esp,4
	
	cmp eax, 0
	je eticheta_nu_prim
      push offset da 
	  call printf  
	  push 0
	  call exit
	
	eticheta_nu_prim:
	 push offset nu 
	  call printf  
	  push 0
	  call exit
	
end start
