;参数和结果传递问题
;编程，计算data段中第一组数据的3次方，结果保存到后面一组的dword单元中


;cube:子程序，用于计算某个数据的3次方
;传入参数：bx
;传出参数：ax,dx

;主要执行流程：
;       初始化，将ds指向数据段，利用si指向dw数组，利用di指向dd数组
;       遍历dw中的元素，执行cube子程序
;       输出结果保存，ax保存在低位，dx保存在元素的高位

assume cs:codesg

    data segment
        dw 1,2,3,4,5,6,7,8
        dd 0,0,0,0,0,0,0,0
    data ends

    codesg segment
        start:  mov ax,data
                mov ds,ax
                mov si,0
                mov di,16

        s:      mov bx,[si]
                call cube
                
                mov [di],ax
                mov [di].2,dx
                add si,2
                add di,4
                loop s

                mov ax,4c00h
                int 21h

        cube:   mov ax,bx
                mul bx,
                mul bx
                ret

    codesg ends

end start