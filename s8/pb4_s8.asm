.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
public start

.data

p DD 1.2, 3.0, 0, 4.9, 8.27
n EQU ($-p)/4 -1
x dd 0
format db "%f",0
text db "introduceti x= ",0
rezultat dd 1.0
final dq 0
aux dd ?

.code
start:
  push offset text
  call printf
  add esp,4

  push offset x
  push offset format
  call scanf
  add esp,8
  
  mov ecx,n

	suma:
	  mov aux,ecx	
      
      produs:
	  FINIT
	  fld x
	  fld rezultat
	  fmul
	  fst rezultat
	  loop produs
	  
	 mov ecx,aux
	
	  FINIT
	  fld p[ecx*4]
	  fld rezultat
	  fmul 
	  fld final
	  fadd
	  fst final 
 
     invers_produs:
	  FINIT
	  fld rezultat
	  fld x
	  fdiv
	  fst rezultat
	  loop invers_produs
	  
    mov ecx,aux
	
 loop suma
 
 FINIT
	  fld p[ecx*4]
	  ; fld rezultat
	  ; fmul 
	  fld final
	  fadd
	  fst final 
 
    
	push dword ptr [final+4]
	push dword ptr [final]
	push offset format
	call printf 
	add esp,12
   
	push 0
	call exit
end start
