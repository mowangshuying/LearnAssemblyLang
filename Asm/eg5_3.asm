;计算ffff:0006单元中的数乘以3结果存储在dx中
assume cs:codesg

codesg segment
    mov ax,0ffffh   ;汇编语言程序中，数据不能以字母为开头，所以ffffh需要写成0ffffh
    mov ds,ax
    mov bx,6

    mov al,[bx]
    mov ah,0        ;al = ds:[bx] = (ffff:0006) ()代表取值，从ffff:0006处取值

    mov dx,0        ;清空dx，即是dx = 0

    mov cx,3        ; 设置循环次数

  s:add dx,ax
    loop s          ;设置标号，并确定要循环的内容

    mov ax,4c00h
    int 21h         ;如果debug中运行到此处，需要使用p命令，结束。而不是t命令执行
codesg ends

end