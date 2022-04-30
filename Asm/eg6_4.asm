; 将数据、代码、栈放入不同的段
;在代码段中使用栈，利用栈将
;   0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
;实现数据逆序存放

assume cs:code,ds:data,ss:stack
    data segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
    data ends

    stack segment
        dw 0,0,0,0,0,0,0,0
    stack ends

    code segment
         start: mov ax,stack ;将栈的首地址放入ax中
                mov ss,ax    ;将ax中的值赋值给ss
                mov sp,20h   ;将栈顶ss:sp指向stack:20

                mov ax,data  ;将数据段首地址赋值给ax
                mov ds,ax    ;将数据段首地址赋值给ax,即是(ds) = (ax)
                mov bx,0     ;将bx设置为0

                mov cx,8

             s1:push [bx]   ;将ds:[bx]的值放入栈中
                add bx,2
                loop s1

                mov bx,0
                mov cx,8

             s2:pop [bx]
                add bx,2
                loop s2

                mov ax,4c00h
                int 21h 

    code ends

end start