;编写子程序，以十六进制在屏幕中间显示给定的字节型数据
;用al传送显示的数据
showbyte:   jmp short show 
            table db '0123456789abcdef'

show:       push bx
            push es

            mov ah,al
            shr ah,1
            shr ah,1
            shr ah,1
            shr ah,1        ;ah存储高位值
            and al,00001111b;al存储低位值

            mov bl,ah
            mov bh,0
            mov ah,table[bx]

            mov bx,0b800h
            mov es,bx
            mov es:[160*12+40*2],ah

            mov bl,al
            mov bh,0
            mov al,table[bx]

            mov es:[160*12+40*2+2],al
            pop es
            pop bx

            ret