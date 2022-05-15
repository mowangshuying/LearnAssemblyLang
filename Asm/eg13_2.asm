;编写,安装中断7ch的中断例程
;功能：求word型数据的平方
;参数(ax)=要计算的数据
;返回值：dx,ax中存放结果的高16位和低16位
;应用举例：2*3456^2

;步骤
;1.编写实现求平方功能的程序
;2.安装程序，将其安装到0:200处
;3.设置中断向量表，将程序入口保存在7ch表项目中，使其成为
;   中断7ch的中断例程

assume cs:codesg

    codesg segment
        start:  mov ax,cs
                mov ds,ax
                mov si,offset sqr
                mov ax,0
                mov es,ax
                mov di,200h
                mov cx,offset sqrend-offset sqr
                cld
                rep movsb

                mov ax,0
                mov es,ax
                mov word ptr es:[7ch*4],200h
                mov word ptr es:[7ch*4+2],0

                mov ax,4c00h
                int 21h

        sqr:    mul ax
                iret
        sqrend: nop

    codesg ends


end start