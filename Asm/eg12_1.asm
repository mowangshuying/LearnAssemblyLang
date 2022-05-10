; 编程：当发生除法溢出错误时候，在屏幕中间显示 "overflow!" 返回DOS


; MOVSB 的英文是 move string byte，意思是搬移一个字节，
;它是把 DS:SI 所指地址的一个字节搬移到 ES:DI 所指的地址上，
;搬移后原来的内容不变，但是原来 ES:DI 所指的内容会被覆盖
;而且在搬移之后 SI 和 DI 会自动地指向下一个要搬移的地址。 
;一般而言，通常程序设计师一般并不会只搬一个字节，通常都会重复许多次，
;如果要重复的话，就得把重复次数 ( 也就是字串长度 ) 先记录在 CX 寄存器，
;并且在 MOVSB 之前加上 REP 指令，REP 是重复 (repeat) 的意思

assume cs:codesg
    codesg segment

        start:  mov ax,cs
                mov ds,ax
                mov si,offset do0

                mov ax,0
                mov es,ax
                mov di,200h

                ;确定指令的长度
                mov cx,offset do0end-offset do0
                ;正向搬运
                cld
                ;指令拷贝
                rep movsb


                ;设置中断向量表
                mov word ptr es:[0*4], 200h
                mov word ptr es:[0*4+2],0

                ; 执行0号中断
                int 0h

                mov ax,4c00h
                int 21h
        
        do0:    jmp short do0start
                db "overflow!"

        do0start:   mov ax,cs
                    mov ds,ax
                    mov si,202h

                    mov ax,0b800h
                    mov es,ax
                    mov di,12*160+36*2
                    
                    mov cx,9
                s:  mov al,[si]
                    mov es:[di],al
                    inc si
                    add di,2
                    loop s

                    mov ax,4c00h
                    int 21h
                    
        do0end: nop ;nop 指令 空指令
    codesg ends
end start