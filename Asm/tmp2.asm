assume cs:codesg

    data segment
         db '056791234'
         db 'the max mum = '
    data ends

    codesg segment
        start:  mov ax,data
                mov ds,ax
                mov bx,0

                ;循环次数
                mov cx,9
                mov si,0

                ;用于表示最大值
                mov al,'0'

            s:  mov ah,ds:[si]
                call cmphl
                inc si
                loop s
                
                mov dx,0b800h
                mov es,dx
                mov es:[160*12+40*2],al


                mov ax,4c00h
                int 21h

        cmphl:  cmp ah,al
                ja s1 
                ret
        s1:     mov al,ah
                ret



    codesg ends

end start