.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
public start

.data
rezultat1 dq ?
rezultat2 dq ?
x dq 3.0
y dq 5.0
format db "%lf",13,10,0
.code
start:
    	
	FINIT 	
	  fld1
	  fld x
	  fdiv
	  f2xm1
	  fld1
	  fadd
	  fst rezultat1
	  
 
    ; push dword ptr [rezultat1+4]
	; push dword ptr [rezultat1]
	; push offset format
	; call printf 
	; add esp,12
	
	FINIT 	
	  fld1
	  fld x
	  fdiv
	  fld y
	  fyl2x
	  f2xm1
	  fld1
	  fadd
	  fst rezultat2
	  
	push dword ptr [rezultat2+4]
	push dword ptr [rezultat2]
	push offset format
	call printf 
	add esp,12
	push 0
	call exit
end start
