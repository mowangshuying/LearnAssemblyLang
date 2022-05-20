assume cs:codesg

    stack segment
        db 128 dup(0)
    stack ends

    data segment
        dw 0,0
    data ends

    codesg segment
        start:  mov ax,stack
                mov ss,ax
                mov sp,128

                mov ax,data
                mov ds,ax

                mov ax,0
                mov es,ax

                push es:[9*4]
                pop ds:[0]
                push es:[9*4+2]
                pop ds:[2]

                mov word ptr es:[9*4],offset int9
                mov es:[9*4+2],cs
                

                mov ax,0b800h
                mov es,ax
                mov ah,'a'
        s:      mov es:[160*12+40*2],ah
                
                call delay1  ;延迟

                inc ah
                cmp ah,'z'
                jna s


                mov ax,0
                mov es,ax

                push ds:[0]
                pop es:[9*4]
                push ds:[2]
                pop es:[9*4+2]

                mov ax,4c00h
                int 21h

        delay1:  push ax

                mov ax,0
        s1:     sub ax,1
                call delay2
                cmp ax,0
                jne s1

                pop ax
                ret

        delay2:  push ax

                mov ax,10
        s2:     sub ax,1
                cmp ax,0
                jne s2

                pop ax
                ret

        int9:   push ax
                push bx
                push es

                in al,60h

                pushf
                pushf
                pop bx
                and bh,11111100b
                push bx
                popf
                call dword ptr ds:[0]

                cmp al,1
                jne int9ret

                mov ax,0b800h
                mov es,ax
                inc byte ptr es:[160*12+40*2+1]

        int9ret: pop es
                 pop bx
                 pop ax
                 iret

    codesg ends

end start