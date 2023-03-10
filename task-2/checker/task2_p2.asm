section .text
	global par

;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression
par:
	push ebp
	push esp
	pop ebp
	push dword [esp + 8]
	pop esi						;len
	push dword [esp + 12]
	pop edi						;sir
	push 0
	pop ecx 					;len stiva
	push 0
	pop ebx
	parcurge_sir:
		cmp byte [edi + ebx], 40 
		je inc_stiva
		cmp ecx, 0
		je invalid
		dec ecx
		jmp stop_inc_stiva
		inc_stiva:
			inc ecx
		stop_inc_stiva:
		inc ebx
		cmp ebx, esi
		je stop_parcurge_sir
		jmp parcurge_sir
	stop_parcurge_sir:
	cmp ecx, 0
	je valid
	invalid:
		push 0
		pop eax
		jmp stop_program
	valid:
		push 1
		pop eax
	stop_program:
	push ebp
	pop esp
	pop ebp
	ret
