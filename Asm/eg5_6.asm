; 计算ffff:0~ffff:b单元（单元是一个byte）中数据和，结果存在dx中

assume cs:codesg

codesg segment
    mov ax,0ffffh
    mov ds,ax
    mov dx,0
    mov bx,0

  s:mov al,ds:[bx]
    mov ah,0
    add dx,ax
    inc bx
    loop s

    mov ax,4c00h
    int 21h

codesg ends

end