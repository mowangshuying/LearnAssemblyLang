assume cs:code,ds:data,ss:stack

data segment

SCREEN_COLOR		dw	0700H

BOUNDARY_COLOR		dw	1131H

NEXT_ROW		dw	160


SNAKE			dw	200 dup (0)
SNAKE_NODE		dw	3

SNAKE_COLOR		dw	2201H


UP			db	48H
DOWN			db	50H
LEFT			db	4BH
RIGHT			db	4DH

data ends

stack segment stack
	db	128 dup (0)
stack ends


;土办法实现移动		bx  printf_block
code segment

	start:	mov ax,stack
		mov ss,ax
		mov sp,128


		call sav_old_int9
		call cpy_greedy_snake
		call set_new_int9


		mov bx,0
		push bx
		mov bx,7E00H
		push bx
		retf

		mov ax,4C00H
		int 21H



;================================================
greedy_snake:	call init_reg
		call clear_screen


		
		call init_screen

		call init_snake




testA:		mov ax,1000H
		jmp testA


		mov ax,4C00H
		int 21H


;================================================数据存储的方式不一样		链表的形式 存放数据	160*10 + 40*2 ,160*10 + 40*2 -2	,160*10 + 40*2 -2-2
init_snake:	mov bx,0
		mov si,160*10 + 40*2

		mov cx,3
		mov dx,SNAKE_COLOR


initSnake:	mov ds:SNAKE[bx],si
		mov es:[si],dx
		add bx,2
		sub si,2
		loop initSnake


		ret

;================================================
init_screen:	mov dx,BOUNDARY_COLOR
		call init_up_down_line
		call init_left_right_line

		ret


;================================================
init_left_right_line:
		mov bx,0
		mov cx,23

initLeftRightLine:
		mov es:[bx],dx
		mov es:[bx+158],dx
		add bx,NEXT_ROW
		loop initLeftRightLine

		ret

;================================================
init_up_down_line:
		mov bx,0
		mov cx,80
		
initUpDownLine:	mov es:[bx],dx
		mov es:[bx+160*23],dx
		add bx,2
		loop initUpDownLine
		
		ret


;================================================
clear_screen:	mov bx,0
		mov dx,SCREEN_COLOR
		mov cx,2000

clearScreen:	mov es:[bx],dx
		add bx,2
		loop clearScreen
		ret

;================================================
init_reg:	mov bx,0B800H
		mov es,bx

		mov bx,data
		mov ds,bx
		ret


;================================================
new_int9:	push ax

		in al,60H
		pushf
		call dword ptr cs:[200H]

		cmp al,UP
		je isUp
		cmp al,DOWN
		je isDown
		cmp al,LEFT
		je isLeft
		cmp al,RIGHT
		je isRight



		cmp al,3BH
		jne int9Ret
		call change_screen_color
		


int9Ret:	pop ax
		iret


;=================================================
isUp:		mov di,160*24 + 40*2
		mov byte ptr es:[di],'U'
		call isMoveUp
		jmp int9Ret

isDown:		mov di,160*24 + 40*2
		mov byte ptr es:[di],'D'
		jmp int9Ret

isLeft:		mov di,160*24 + 40*2
		mov byte ptr es:[di],'L'
		jmp int9Ret

isRight:	mov di,160*24 + 40*2
		mov byte ptr es:[di],'R'
		jmp int9Ret



;=================================================
isMoveUp:	mov si,ds:SNAKE[0]
		sub si,NEXT_ROW		


		cmp byte ptr es:[si],0
		jne noMoveUp
		call new_snake


noMoveUp:	ret


;=================================================
new_snake:	call clear_old_snake
		call set_new_snake
		call print_snake
		ret


;=================================================
print_snake:
		mov bx,0
		mov cx,SNAKE_NODE
		mov dx,SNAKE_COLOR

printSnake:	mov di,ds:SNAKE[bx]
		mov es:[di],dx
		add bx,2
		loop printSnake

		ret


;=================================================
set_new_snake:
		mov bx,0
		add bx,SNAKE_NODE
		add bx,SNAKE_NODE
		sub bx,2

		mov cx,SNAKE_NODE
		dec cx
		
setNewSnake:	push ds:SNAKE[bx-2]
		pop ds:SNAKE[bx]
		sub bx,2
		loop setNewSnake


		mov ds:SNAKE[0],si

		ret

;=================================================
clear_old_snake:

		mov bx,0		
		mov dx,SCREEN_COLOR
		mov cx,SNAKE_NODE

clearOldSnake:	mov di,ds:SNAKE[bx]
		mov es:[di],dx
		add bx,2
		loop clearOldSnake


		ret


;=================================================
change_screen_color:
		push bx
		push cx
		push es
		
		mov bx,0B800H
		mov es,bx
	
		mov bx,1
		mov cx,2000

changeScreenColor:
		inc byte ptr es:[bx]
		add bx,2
		loop changeScreenColor

		pop es
		pop cx
		pop bx
		ret

snake_end:	nop






;================================================
set_new_int9:	mov bx,0
		mov es,bx

		cli
		mov word ptr es:[9*4],OFFSET new_int9 - OFFSET greedy_snake + 7E00H
		mov word ptr es:[9*4+2],0
		sti
		ret


;================================================
sav_old_int9:	mov bx,0
		mov es,bx

		push es:[9*4]
		pop es:[200H]
		push es:[9*4+2]
		pop es:[202H]
		ret

;================================================
cpy_greedy_snake:
		mov bx,cs
		mov ds,bx
		mov si,OFFSET greedy_snake

		mov bx,0
		mov es,bx
		mov di,7E00H

		mov cx,OFFSET snake_end - OFFSET greedy_snake
		cld
		rep movsb

		ret







code ends



end start
