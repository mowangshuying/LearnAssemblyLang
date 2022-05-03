; 在屏幕中间显示"welcom to masm!"
; 确定行:b800h+a0H*行号()
; 确定位置:02h*位置(16进制数)

assume cs:codesg

    codesg segment
        start:  mov ax,0b800h
                mov ds,ax
                mov bx,7c2h

                mov al,77h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,65h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,6ch
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,63h
                mov ah,02h
                mov [bx],ax
                add bx,2


                mov al,6fh
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,6dh
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,65h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,20h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,74h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,6fh
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,20h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,6dh
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,61h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,73h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,6dh
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov al,21h
                mov ah,02h
                mov [bx],ax
                add bx,2

                mov ax,4c00h
                int 21h
    codesg ends
end start