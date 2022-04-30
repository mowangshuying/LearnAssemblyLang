;考虑这样一个问题，编程计算以下8个数据的和，结果存在ax中
;   0123h、0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
assume cs:codesg

codesg segment

    dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h

    mov bx,0    ;确定编译地址
    mov ax,0    ;用于存放总和
    mov cx,8    ;用户存放循环次数

  s:add ax,cs:[bx]  ;(ax) = (ax)+(cs:[bx])
    add bx,2        ;(bx) = (bx)+2
    loop s          ;循环

    mov ax,4c00h    ;用于程序返回
    int 21h         ;用于程序返回
codesg ends

end