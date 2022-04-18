assume cs:code



code segment



		mov bx,0B800H
		mov es,bx
		
		mov bx,160*10 + 40*2

		mov word ptr es:[bx],5535H






		mov ax,4C00H
		int 21H



code ends



end