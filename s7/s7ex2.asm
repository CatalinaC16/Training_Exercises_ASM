.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
format db "%d", 13, 10, 0
.code

fibo proc
	push ebp
	mov ebp, esp ; pregatim stack frame-ul
	
	
	sub esp, 4 ; facem loc pe stiva pentru o variabila
	mov eax, [ebp+8] ; citim primul argument de pe stiva
	cmp eax, 0 ; verificam daca argumentul e 0
	je fibo_final
	cmp eax, 1
	je fibo_final ; verificam daca argumetnul e 1
	dec eax 
	push eax
	call fibo ; calculam fibo(n-1)
	mov [ebp-4], eax ; punem rezultatul in variabila locala
	mov eax, [ebp+8] ; luam din nou argumentul
		; in cadrul apelului, eax s-a modificat
	sub eax, 2
	push eax
	call fibo ; calculam si fibo(n-2)
	add eax, [ebp-4] ; fibo(n) = fibo(n-2) + fibo(n-1)
	
	
fibo_final:
	mov esp, ebp
	pop ebp
	ret 4 ; salt inapoi la adresa de return, si curata parametrii de pe stiva
fibo endp

start:
	push 6
	call fibo
	
	push eax
	push offset format
	call printf
	add esp, 8
	;terminarea programului
	push 0
	call exit
end start
