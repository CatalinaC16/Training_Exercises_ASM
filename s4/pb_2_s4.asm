.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
public start

.data
var DW 0
format db "%d",0
ANGAJAT struct
   
   nume DB 20 dup(0)
   salariu DW 0
   
ANGAJAT ends

nrAngajati DW 4
angajati ANGAJAT {"georgescu",100},{"pop",100},
                 {"popescu",300},{"ionescu",450}

.code
start:


 mov esi,0
 mov eax,0
 mov ax, angajati[esi].salariu
 add esi,22
 add ax,angajati[esi].salariu
  add esi,22
 add ax,angajati[esi].salariu
  add esi,22
 add ax,angajati[esi].salariu
 
 
   ; lea esi,angajati
   ; mov eax,0
   ; mov ax,(ANGAJAT ptr [esi]).salariu
   ; add esi,22
   ; add ax,(ANGAJAT ptr [esi]).salariu
   ; add esi,22
   ; add ax,(ANGAJAT ptr [esi]).salariu
   ; add esi,22
   ; add ax,(ANGAJAT ptr [esi]).salariu
  
  

  push eax
  push offset format
  call printf
  add esp,8
  
	push 0
	call exit
end start