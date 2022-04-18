assume cs:code,ds:data,ss:stack

data segment
	dw	1230,12666,1,8,3,38,0
data ends


string segment
	db	10 dup ('0'),0
string ends


stack segment stack
	db	128 dup (0)
stack ends





code segment

	start:	mov ax,stack
		mov ss,ax
		mov sp,128



		call init_reg


		call show_number



		mov ax,4C00H
		int 21H



;==============================================
show_number:	mov bx,0
		mov si,9
		mov di,160*10 + 30*2
		
		mov cx,7
		

showNumber:	call show_word

		add di,160
		add bx,2
		loop showNumber


		ret



;==============================================
show_word:	push ax
		push bx
		push cx
		push dx
		push ds
		push es
		push si
		push di

		mov ax,ds:[bx]
		mov dx,0
		
		call short_div
		
		call init_reg_show_string

		call show_string


		pop di
		pop si
		pop es
		pop ds
		pop dx
		pop cx
		pop bx
		pop ax
		ret




;==============================================
show_string:	push cx
		push ds
		push es
		push si
		push di

		mov cx,0
	

showString:	mov cl,ds:[si]
		jcxz showStringRet
		mov es:[di],cl
		add di,2
		inc si
		jmp showString


showStringRet:	pop di
		pop si
		pop es
		pop ds
		pop cx
		ret



;==============================================
init_reg_show_string:
		mov bx,string
		mov ds,bx
	
		mov bx,0B800H
		mov es,bx
		ret

;==============================================
short_div:	mov cx,10
		div cx
		add dl,30H
		mov es:[si],dl
		mov cx,ax
		jcxz shortDivRet
		dec si
		mov dx,0
		jmp short_div


shortDivRet:	ret


;==============================================
init_reg:	mov bx,data
		mov ds,bx

		mov bx,string
		mov es,bx
		ret


code ends



end start

