;大小写转换问题,将datasg的第一个字符串转化为大写
;将datasg的第二个字符串转化为小写


;分析一下：我们知道同一个大写字符和小写字符对应的ascii字符
;是不同的，比如'A'对应的ascii的码是41h,'a'的ascii码是61h
;要改变一个字母的大小，就是要改变其ascii码值，我们吧ascii
;列出来，进行一下对比找寻规律
;   大写    十六进制    二进制              小写    十六进制    二进制
;   A       41          01000001            a       61          01100001
;   B       42          01000010            b       62          01100010
;   C       43          01000011            c       63          01100011
;   D       44          01000100            d       64          01100100
;   E       45          01000101            e       65          01100101
;   ...
;通过对比，我们看出来，小写的ascii码比大写的ascii码值大20h.这样我们可以想到
;如果将A的ascii码值加上20h就可以得到a。按照这样的方法可以将datasg段第一个字符串
;变成小写，将datasg第二个字符串变成大写
;注意：
;对于字符串Basic，应该只要针对小写字母进行减20h的处理，大写字母不进行改变
;对于字符串iNfOrMaTiOn 我们值对其中大写字母进行加20h处理，小写字母不进行改变
assume cs:codesg,ds:datasg
    datasg segment
        db 'BaSic'
        db 'iNforMaTion'
    datasg ends
    codesg segment
        start:  mov ax,datasg
                mov ds,ax
                mov bx,0
                mov cx,5
            s1: mov al,[bx]
                and al,11011111b ;将第五个位置设置为0变成大写字母
                mov [bx],al
                inc bx
                loop s1

                mov bx,5
                mov cx,11
            
            s2: mov al,[bx]
                or al,00100000b ;将第五个位置设置为1变成小写字母
                mov [bx],al
                inc bx
                loop s2

                mov ax,4c00h
                int 21h
    codesg ends
end start