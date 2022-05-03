;mul运算
;8位和8位相乘，一个默认乘数放入al,最终结果存放到ax中
;16位和16位相乘,一个默认乘数放入ax中，最终结果，低位存放到ax中，高位存放到dx中

assume cs:codesg

    codesg segment
        start:  mov al,100
                mov bl,10
                mul bl      ;(ax)=1000(03e8H)

                mov ax,100 
                mov bx,10000
                mul bx          ;(ax)=4240H  (dx)=000fH  000f4240 = 1000000

                mov 4c00h
                int 21h
    codesg ends
    
end start