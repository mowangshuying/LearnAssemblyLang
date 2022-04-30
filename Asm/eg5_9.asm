;将内存ffff:0~ffff:b单元中的数据复制到0:200~0:20b
; 0:200~0:20b 等价于 20:0~20:b (段地址转换)
; ffff:0~ffff:b一共有12内存单元(byte <字节>)
;   应该是将ffff:[x]复制到20:[x]
assume cs:codesg

codesg segment

    mov bx,0  ;用于遍历数据，从0~11
    mov cx,12 ;循环次数

    mov ax,0ffffh ;
    mov ds,ax

    mov ax,0020h
    mov es,ax


  s:mov dl,ds:[bx] ;dx的低位
    mov es:[bx],dl
    
    inc bx      ;(bx) = (bx)+1 将bx移动到下一个位置
    loop s

    mov ax,4c00h
    int 21h
codesg ends

end