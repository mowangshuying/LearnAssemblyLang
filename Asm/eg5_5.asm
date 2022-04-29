; 计算ffff:0~ffff:b单元（单元是一个byte）中数据和，结果存在dx中
assume cs:code

code segment

    mov ax,0ffffh
    mov ds,ax
    
    mov dx,0    ;初始化累加寄存器(dx) = 0

    mov al,ds:[0] ;(dx) = (dx)+((ds)*16+0)
    mov ah,0
    add dx,ax

    mov al,ds:[1]
    mov ah,0
    add dx,ax

    mov al,ds:[2]
    mov ah,0
    add dx,ax

    mov al,ds:[3]
    mov ah,0
    add dx,ax

    mov al,ds:[4]
    mov ah,0
    add dx,ax

    mov al,ds:[5]
    mov ah,0
    add dx,ax

    mov al,ds:[6]
    mov ah,0
    add dx,ax

    mov al,ds:[8]
    mov ah,0
    add dx,ax

    mov al,ds:[9]
    mov ah,0
    add dx,ax

    mov al,ds:[ah] ;(dx) = (dx)+((ds)*16+ah)
    mov ah,0
    add dx,ax

    mov al,ds:[bh] ;(dx) = (dx)+((ds)*16+bh)
    mov ah,0
    add dx,ax


    mov ax,4c00h
    int 21h
code ends

end