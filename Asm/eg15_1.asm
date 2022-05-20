assume cs:codesg

    stack segment
        db 128 dup(0)
    stack ends
    codesg segment
        start:  mov ax,stack
                mov ss,ax
                mov sp,128

                mov ax,0b800h
                mov es,ax
                mov ah,'a'
        s:      mov es:[160*12+40*2],ah
                
                call delay1  ;延迟

                inc ah
                cmp ah,'z'
                jna s

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

    codesg ends

end start