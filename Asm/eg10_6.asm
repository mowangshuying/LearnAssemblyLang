;具体的子程序的源程序框架
assume cs:codesg

    codesg segment
        main:   ...
                ...
                ...

                ;call sub1

                ;call sub2

                mov ax,4c00h
                int 21h

        sub1:   ...
                ...
                ret

        sub2:   ...
                ...
                ret

        sub3:   ...
                ...
                ;call sub1
                ;call sub2
                ret


    codesg ends

end main
