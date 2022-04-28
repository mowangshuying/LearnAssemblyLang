assume cs:codesg

codesg segment
    mov ax,2 ; ax = 2
    mov cx,11 ; cx = 11
  s:add ax,ax
    loop s    ; 一直循环知道cx=0

    mov ax,4c00h
    int 21h
codesg ends

end