.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
public start

.data

rezultat dq ?
ec dq 0
n dd ?
aux dd ?
format db "rezultatul ecuatiei este %f",0
format_n db "%d",0
text db "introduceti n= ",0
.code
start:
  push offset text
  call printf
  add esp,4
  
  
  push offset n
  push offset format_n
  call scanf
  add esp,8
 
 mov ecx,n

	suma:
	  mov aux,ecx	
		   FINIT
		   fild aux
		   fild aux
		   fsqrt 
		   fld ST(1)
		   fdiv
		   fadd rezultat
		   fst rezultat
	loop suma

    
	push dword ptr [rezultat+4]
	push dword ptr [rezultat]
	push offset format
	call printf 
	add esp,12
   
	push 0
	call exit
end start
