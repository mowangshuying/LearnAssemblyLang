;下面程序ret指令执行后，(ip) = 0，cs:ip指向代码段的第一条指令
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
                push ax
                mov bx,0
                ret ;(ax)=0;(ip)=0;codesg:0 ==> 代码段的第一条指令
    codesg ends

end start