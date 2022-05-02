;下面程序retf指令执行后，(ip) = 0，cs:ip指向代码段的第一条指令
assume cs:codesg

    stack segment
        db 16 dup (0)
    stack ends

    codesg segment
                mov ax,4c00h
                int 21h

        start:  mov ax,stack
                mov ss,ax
                mov sp,16

                mov ax,0
                push,cs     ;cs指向当前代码段
                push ax     ;ax = 0
                mov bx,0
                retf        ;pop cs,pop ip
    codesg ends

end start