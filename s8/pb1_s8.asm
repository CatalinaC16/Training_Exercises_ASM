.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
public start

.data

x dd 30
intermidiar dq ?
grade dq 180.0 
format_plus db "Sin=+%f",0
format_minus db "Sin=-%f",0
format_1 db "%d",0

.code
start:
    ; push offset x
	; push offset format_1
    ; call scanf
	; add esp,8
	
	
	FINIT 	
		fild x
		fldpi
		fmul
		fld grade
		fdiv
		fst intermidiar	
	
	FINIT
		fld intermidiar
		fptan 
		fld ST(1)
		fld ST(0)
		fmul
		fld ST(0)
		fld1
		fadd
		fdiv
		fsqrt
		fst intermidiar

	cmp x,180
	jg minus
	
	push dword ptr [intermidiar+4]
	push dword ptr [intermidiar]
	push offset format_plus
	call printf 
	add esp,12
	push 0
	call exit
	
	
minus:
    push dword ptr [intermidiar+4]
	push dword ptr [intermidiar]
	push offset format_minus
	call printf 
	add esp,12
	
	
	push 0
	call exit
end start
