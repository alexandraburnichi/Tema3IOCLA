
section .text
	global sort


; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list
sort:
	enter 0, 0

	mov esi, [ebp + 8] 
	mov edi, [ebp + 12] 

	push ebp
	mov ebp, 0 
	bucla_sort_i:
		mov eax, dword [edi + ebp * 8]
		mov ecx, ebp
		inc ecx
		bucla_sort_j:
			mov ebx, dword [edi + ecx * 8]
			cmp eax, ebx
			jg do_swap
			jmp not_do_swap
			do_swap:
				mov edx, eax
				mov eax, ebx
				mov ebx, edx
				mov dword [edi + ebp * 8], eax
				mov dword [edi + ecx * 8], ebx
			not_do_swap:
			inc ecx
			cmp ecx, esi
			je iesire_bucla_sort_j
			jmp bucla_sort_j
		iesire_bucla_sort_j:
		inc ebp
		push esi
		dec esi
		cmp ebp, esi
		pop esi
		je iesire_bucla_sort_i
		jmp bucla_sort_i
	iesire_bucla_sort_i:

	lea eax, [edi]
	mov ebp, 0
	lipire_noduri:
		lea ebx, [eax + ebp * 8 + 8]
		mov [eax + ebp * 8 + 4], ebx
		inc ebp
		push esi
		dec esi
		cmp ebp, esi
		pop esi
		je ieisre_lipire_noduri
		jmp lipire_noduri
	ieisre_lipire_noduri:
	

	
	pop ebp
	leave
	ret
