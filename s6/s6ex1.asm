.386
.model flat, stdcall

includelib msvcrt.lib
extern printf: proc
extern exit: proc

public start

.data
msg db "Hello world!", 13, 10, "Numarul %d se scrie in hexazecimal ca %XH", 0 ;un string trebuie sa fie NULL terminated, pentru a putea fi afisat cu printf

.code
start:
	mov eax, 25
	push eax
	push eax
	push offset msg ;argumentele unei functii se pun pe stiva, in ordine inversa
	call printf
	;conventia de apel la printf e cdecl, ceea ce inseamna ca cine apeleaza, trebuie sa curete stiva
	add esp, 12 ;am pus 3 dword pe stiva(pe 32bit, un pointer e tot dword), deci trebuie sa eliminam ultimii 3*4=12 octeti
	push 0
	call exit
end start
