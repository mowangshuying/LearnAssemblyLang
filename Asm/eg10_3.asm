assume cs:code

    stack segment
        dw 8 dup(0)
    stack ends

    code segment
        start:  mov ax,stack ;初始化栈
                mov ss,ax
                mov sp,16

                mov ds,ax
                mov ax,0
                call word ptr ds:[0EH]
    
                inc ax
                inc ax
                inc ax
                
                mov ax,4c00h
                int 21h

    code ends

end start