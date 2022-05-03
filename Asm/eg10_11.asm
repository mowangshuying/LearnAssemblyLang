;将data段中的字符串全部转化为大写
;注意到一个问题是：标号s处和captital处都使用了cx寄存器
assume cs:codesg

    data segment
        db 'word',0
        db 'unix',0
        db 'wind',0
        db 'good',0
    data ends

    codesg segment
        start:  mov ax,data
                mov ds,ax
                mov bx,0

                mov cx,4
        
        s:      mov si,bx
                call captital
                add bx,5
                loop s

                mov ax,4c00h
                int 21h

        captital:mov cl,[si]
                mov ch,0
                jcxz ok         ;如果(cx)==0,跳转到标号执行
                and byte ptr [si],11011111b
                inc si
                jmp short captital
        ok:     ret
    codesg ends

ends start