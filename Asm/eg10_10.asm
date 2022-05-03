;设计一个子程序,功能将一个全是字母，以零为结尾的字符串，转化为大写

; 程序要处理的字符串以0位结尾符号，这个字符串可按如下定义：
; db 'conversation',0

assume cs:codesg

    data segment
        db 'conversation',0
    data ends

    codesg segment
        start:  mov ax,data
                mov ds,ax
                mov si,0
                call captital

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