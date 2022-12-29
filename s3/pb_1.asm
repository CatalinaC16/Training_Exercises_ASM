.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

;EAX = 7*EAX - 2*EBX - EBX/8
num1 DD 7
num2 DD 0
num3 DD 8

.code

start:

   mov eax, 3
   mov ebx, 8

   mul num1
   mov num1, eax

   mov eax, 2
   mul ebx
   mov num2, eax

   mov edx, 0
   mov eax, 0
   mov eax, ebx
   div num3
   mov num3,eax

   mov ecx,num2
   mov edx,num3
   sub num1,ecx
   sub num1,edx

   push 0
   
  call exit
end start
