;在其他段中使用数据标号
;一般来说我们不在代码段重定义数据，而是将数据定义到其他段中；
;在其他段中我们也可以使用数据标号来存储数据的单元和长度
;地址标号只能在代码段中使用不能在其他段中使用

; 如果想在代码段中直接用数据标号访问数据，需要使用伪指令assume
; 将标号所在的段和一个段联系起来，否则编译器在编译时候，无法确定
; 标号段地址在那个寄存器中。
assume cs:codesg,ds:datasg

datasg segment
    a db 1,2,3,4,5,6,7,8
    b dw 0
datasg ends

codesg segment
    start:  mov ax,datasg
            mov ds,ax       ;给ds赋值，让ds指向datasg的段地址

            mov si,0
            mov cx,8

        s:  mov al,a[si]    ;mov al,a[si]相当于mov al,[0+si]
            mov ah,0
            add b,ax        ;add b,ax 相当于 add [8],ax
            inc si
            loop s

            mov ax,4c00h
            int 21h
codesg ends


end start