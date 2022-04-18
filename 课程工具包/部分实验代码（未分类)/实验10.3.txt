assume cs:code,ds:data,ss:stack

data segment

	dd	1000000

data ends

stack segment stack
	db	128 dup (0)
stack ends






code segment

	start:	mov ax,stack
		mov ss,ax
		mov sp,128




;		mov ax,4240H
;		mov dx,0FH

		mov bx,data
		mov ds,bx

		mov bx,0

		mov ax,ds:[bx+0]		;参数		被除数低16位	L
		mov dx,ds:[bx+2]		;参数		被除数高16位	H
	
		mov cx,10			;参数		除数	N

		push ax
		mov bp,sp			;ss:[bp+0]


		call long_div


;公式： X/N = int(H/N)*65536 + [rem(H/N)*65536+L]/N


		mov ax,4C00H
		int 21H


;======================================================
long_div:	mov ax,dx
		mov dx,0
		div cx			;ax = 	 int(H/N) => dx		dx = rem(H/N)*65536

		push ax	

		mov ax,ss:[bp+0]	;L

		div cx			;ax = 	 [rem(H/N)*65536+L]/N 的 商 	dx = 余数

		mov cx,dx		;dx = 1	ax = 86A0H

		pop dx	
	
		ret



code ends



end start
