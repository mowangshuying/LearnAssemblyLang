;int 指令模拟0号中断

assume cs:codesg

    codesg segment
        start:  mov ax,0b800h
                mov es,ax
                mov byte ptr es:[12*160+40*2],'!'
                int 0

                mov ax,4c00h
                int 21h
    codesg ends

end start