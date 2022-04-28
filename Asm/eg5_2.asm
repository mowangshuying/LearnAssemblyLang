assume cs:codesg

codesg segment

    mov ax,0 ;将0放入ax
    mov cx,236 ;将236放入cx

    s:add ax,123;每次循环，a = a + 123
    loop s ;只要cx不等于0，add ax,123

    mov ax,4c00h ;用于程序返回
    int 21h      ;用于程序返回

codesg ends

end