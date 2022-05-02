; 将cosesg段中a标号出的8个数据累加,结果存储到b标号的字符串中
assume cs:codesg

    codesg segment
    a:      db 1,2,3,4,5,6,7,8
    b:      dw 0

    start:  mov si,offset a 
            mov bx,offset b
            mov cx,8
    s:      mov al,cs[si] 
            mov ah,0
            add cs:[bx],ax
            inc si
            loop s

            mov ax,4c00h
            int 21h
    codesg ends  

end start