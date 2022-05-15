; 对应视频中的18.2小节
assume cs:codesg
    codesg segment
        start:  mov ax,3456
                int 7ch
                add ax,ax
                adc dx,dx

                mov ax,4c00h
                int 21h
    ends segment
end start