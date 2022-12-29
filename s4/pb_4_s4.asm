.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
  
  vect DB 1,3,2,1,2
  
.code
start:
   
    mov eax, 0
	mov esi, 0
	mov ecx, 0
	mov edx, 0
	mov edi, 0
	
	add al,vect[esi]
	inc esi
	add al,vect[esi]
	inc esi
	add al,vect[esi]
	inc esi
	add al,vect[esi]
	inc esi
	add al,vect[esi]
	inc esi
	mov cl,al
	
	mov eax,0
	inc esi
	mov eax,esi
	mov edi,2
	div edi
	mov edi,eax
	inc edi
	mul edi
	
	;numarul care lipseste va ramane in registrul eax, prin scadere din cat ar fi trebuit
	;sa fie 2*(n*(n+1))/2- suma nr prezente= cel cautat
	
	sub al,cl
		    
	push 0
	call exit
end start
