assume cs:codesg

    stack segment
        db 128 dup(0)
    stack ends

    data segment
        dw 0,0
    data ends

    codesg segment
        start:  mov ax,stack ;执行栈的初始化信息
                mov ss,ax
                mov sp,128


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;保存9号中断向量表信息，并设置新的信息
                mov ax,data  
                mov ds,ax
                mov ax,0
                mov es,ax
                push es:[9*4]
                pop ds:[0]      ;存取9号中断向量的中断程序对应的偏移地址
                push es:[9*4+2]
                pop ds:[2]      ;存储9号中断向量的中断程序对应的段偏移地址


                mov word ptr es:[9*4],offset int9 ;修改9号中断向量的中断程序对应的偏移地址
                mov es:[9*4+2],cs                 ;修改9号中断向量的中断程序对应的段偏移地址
                



                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ; 屏幕上延迟上显示a,b,c....,z
                mov ax,0b800h
                mov es,ax
                mov ah,'a'
        s:      mov es:[160*12+40*2],ah
                
                call delay1  ;延迟

                inc ah
                cmp ah,'z'
                jna s


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;从data段中读取暂存的9号中断向量表信息重新给9号中断向量的
                ;偏移地址和段地址赋值
                mov ax,0
                mov es,ax
                push ds:[0]
                pop es:[9*4]
                push ds:[2]
                pop es:[9*4+2]
                
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;用于程序返回
                mov ax,4c00h
                int 21h

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;delay1：用于延迟作用
        delay1:  push ax

                mov ax,0
        s1:     sub ax,1
                call delay2
                cmp ax,0
                jne s1

                pop ax
                ret

        delay2:  push ax

                mov ax,10
        s2:     sub ax,1
                cmp ax,0
                jne s2

                pop ax
                ret

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;自定义9号中断向量表程序
        int9:   push ax
                push bx
                push es


                in al,60h       ;读取键盘信息，从端口中读取

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;标志寄存器入栈
                pushf


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;设置IF=0,TF=0
                ;普及标志寄存器的知识
                ;flag寄存器的结构表示如下：
                        ;0      ->      CF
                        ;1      
                        ;2      ->      PF
                        ;3      
                        ;4      ->      AF
                        ;5
                        ;6      ->      ZF
                        ;7      ->      SF
                        ;8      ->      TF
                        ;9      ->      IF
                        ;10     ->      DF
                        ;11     ->      OF
                        ;12
                        ;13
                        ;14
                        ;15
                ;

                ;call dword ptr ds:[0]

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;保存标志寄存的值到bx中
                pushf
                pop bx
                ;IF和TF为标志寄存的第8位和第9位，利用and运算将bx的第8位和第9位设置为零
                and bh,11111100b
                ;bx的内容赋值给标志寄存器        
                push bx
                popf
                ;跳转到中断例程地址
                call dword ptr ds:[0]

                ;比较键盘输入的值是否为1,即是ESC键，如果是ESC键继续执行，改变颜色
                ;如果不是ESC键直接返回
                cmp al,1
                jne int9ret

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;用于修改字体的属性
                mov ax,0b800h
                mov es,ax
                inc byte ptr es:[160*12+40*2+1]

        int9ret: pop es
                 pop bx
                 pop ax
                 iret

    codesg ends

end start