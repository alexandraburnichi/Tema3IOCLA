section .text
	global cmmmc

;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b
cmmmc:
	push ebp
	push esp
	pop ebp
	push dword [esp + 8] ;a
	pop esi
	push dword [esp + 12] ;b
	pop edi
	push 0
	pop edx
	push esi
	pop eax
	push edi
	pop ebx
	mul ebx
	push eax
	pop ecx ;prod
	calculeaza_cmmdc:
		push esi
		pop eax
		push 0
		pop edx
		div edi
		push edi
		pop esi ;cmmdc
		push edx
		pop edi
		cmp edi, 0
		je calculeaza_cmmmc
		jmp calculeaza_cmmdc
	calculeaza_cmmmc:
	push ecx
	pop eax
	push 0
	pop edx
	div esi
	push ebp
	pop esp
	pop ebp
	ret
