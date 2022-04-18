assume cs:code,ds:data,ss:stack

data segment

STRING		db	128 dup (0),0,0,0,0


data ends

stack segment stack
	db	128 dup (0)
stack ends



code segment

	start:	mov ax,stack
		mov ss,ax
		mov sp,128


		call clear_screen
		call init_reg
		call get_string


		mov ax,4C00H
		int 21H




;======================================================
get_string:	mov si,OFFSET STRING
		mov di,160*10 + 40*2
		mov bx,0			;TOP

getString:	mov ah,0
		int 16H
		cmp al,20H
		jb notChar
		call char_push
		call show_string
		jmp getString



isEnter:	ret


notChar:	cmp ah,1CH
		je isEnter
		cmp ah,0EH
		je isBackSpace
		jmp getString



;======================================================
show_string:	push dx
		push ds
		push es
		push si
		push di
		

showString:	mov dl,ds:[si]
		cmp dl,0
		je showStringRet
		mov es:[di],dl
		add di,2
		inc si
		jmp showString

showStringRet:	mov byte ptr es:[di],0
		pop di
		pop si
		pop es
		pop ds
		pop dx
		ret
;======================================================
char_push:	cmp bx,127
		ja charPushRet
		mov ds:[si+bx],al
		inc bx

charPushRet:	ret


;======================================================
char_pop:	cmp bx,0
		je charPopRet
		dec bx
		mov byte ptr ds:[si+bx],0

charPopRet:	ret
;======================================================
isBackSpace:	call char_pop
		call show_string
		jmp getString


;======================================================
clear_screen:	mov bx,0B800H
		mov es,bx

		mov bx,0
		mov dx,0700H
		mov cx,2000
		
clearScreen:	mov es:[bx],dx
		add bx,2
		loop clearScreen
		
		ret
;======================================================
init_reg:	mov bx,data
		mov ds,bx

		mov bx,0B800H
		mov es,bx
		ret

code ends



end start



