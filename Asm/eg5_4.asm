;计算ffff:0006单元中的数乘以123结果存储在dx中
assume cs:codesg

codesg segment
    mov ax,0ffffh   ;汇编语言程序中，数据不能以字母为开头，所以ffffh需要写成0ffffh
    mov ds,ax
    mov bx,6

    mov al,[bx]
    mov ah,0        ;al = ds:[bx] = (ffff:0006) ()代表取值，从ffff:0006处取值

    mov dx,0        ;清空dx，即是dx = 0

    mov cx,123        ; 设置循环次数 相比于eg5_3,此处仅仅吧次数修改为123

  s:add dx,ax
    loop s          ;设置标号，并确定要循环的内容

    mov ax,4c00h
    int 21h         ;如果debug中运行到此处，需要使用p命令，结束。而不是t命令执行
codesg ends

end

; 之前执行循环的话，都是在debug中键入t命令，单步执行。
; 如果我们希望将循环一次执行完，可以使用p命令来达到目的。再次遇到loop指令的时候，使用p命令
; 执行debug就会自动重复执行循环中的指令，直到(cx)=0为止
; 也可以使用debug中的g命令跳转到 mov ax,4c00h这条指令