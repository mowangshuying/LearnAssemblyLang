; 假设内存中的情况(假设程序从1000::0处装入)
assume cs:codesg

    stack segment
        db 8 dup (0)    ;1000:0000 00 00 00 00 00 00 00 00
        db 8 dup (0)    ;1000:0008 00 00 00 00 00 00 00 00
    stack ends

    codesg segment
        start:  mov ax,stack
                mov ss,ax
                mov sp,16

                mov ax,1000
                call s

                mov ax,4c00h
                int 21h

            s:  add ax,ax
                ret
    codesg ends

end start