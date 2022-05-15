; 对应视频中的18.2小节
; 执行方式如下：
;               (1)先执行eg13_2_1.exe安装中断
;               (2)再执行eg13_2_2.exe运行相应程序即可
;
;           注：
;               一定要注意程序返回,安装中断程序中一定要出现：
;                   mov ax,4c00h
;                   int 21h
;               用于程序返回
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