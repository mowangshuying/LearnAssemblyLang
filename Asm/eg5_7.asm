assume cs:codesg

codesg segment

    mov ax,0              ;这里要注意的一个问题 0,0h
    mov ds,ax             
    mov ds:[26h],ax        ;这句是不对的，dos程序预留了前256字节用于程序通讯，不可以被用户改写

    mov ax,4c00h
    int 21h
codesg ends

end