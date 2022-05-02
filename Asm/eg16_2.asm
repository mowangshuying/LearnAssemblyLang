; 将cosesg段中a标号出的8个数据累加,结果存储到b标号的字符串中
; 标号不仅仅表示内存单元地址，更表示内存单元长度
assume cs:codesg

    codesg segment
    a:      db 1,2,3,4,5,6,7,8
    b:      dw 0

    start:  mov si,0
            mov cx,8
            
    s:      mov al,a[si] 
            mov ah,0
            add b,ax
            inc si
            loop s

            mov ax,4c00h
            int 21h
    codesg ends  

end start