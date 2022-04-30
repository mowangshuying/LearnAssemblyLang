; 以字符形式给出数据
assume cs:code,ds:data
    data segment
        db 'unIX'   ; db 'unIX' 相当于 db 75h,6eh,49h,58h
        db 'foRK'   ; db 'foRK' 相当于 db 66h,6fh,52h,4bh
    data ends

    code segment
        start:  mov al,'a'  ;将字符a的ascii码值给al
                mov bl,'b'  ;将字符b的ascii码值给bl

                mov ax,4c00h    ;用于程序返回，正常结束程序
                int 21h         ;用于程序返回，正常结束程序
    code ends
end start

; 使用-r命令查看ds的地址为：ds=075a
; data是程序中的第一个段，它就在程序起始处，所以他的地址为ds+10h=076a