;calculeaza in eax, n!
factorial macro n
local fact_bucla, fact_final
	push ecx
	push edx
	mov eax, 1
	mov ecx, n
	test ecx, ecx ; vedem daca nu cumva ecx=0
	jz fact_final ; daca e 0, nu mai facem inmultiri
fact_bucla:
	mul ecx
	loop fact_bucla
fact_final:
	pop edx
	pop ecx
endm