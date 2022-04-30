;在代码段中使用栈，利用栈将
;   0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
;实现数据逆序存放

assume cs:codesg

codesg segment
     dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
     dw 0,  0,  0,  0,  0,  0,  0,  0 ;定义用于倒序所用的数据栈

     start: mov ax,cs
            mov ss,ax
            mov sp,30h ;将栈顶ss:sp:sp指向cs:30

            mov bx,0
            mov cx,8

    s1:     push cs:[bx]
            add bx,2
            loop s1

            mov bx,0
            mov cx,8

    s2:     pop cs:[bx]
            add bx,2
            loop s2

            mov ax,4c00h
            int 21h

codesg ends

end start