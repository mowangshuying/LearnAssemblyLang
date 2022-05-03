;批量数据传递
assume cs:codesg

    data segment
        db 'conversation'
    data ends

    codesg segment
        start:  mov ax,data
                mov ds,ax
                mov si,0
                mov cx,12
                
                call captital

                mov ax,4c00h
                int 21h

        captital:add byte ptr [si],11011111b    ;传入的是'conversation',具体的参数为si存放首地址，cx存放数组的大小
                inc si                          
                loop captital
                ret

    codesg ends

end start