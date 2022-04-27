assume cs:codesg

codesg segment
	start:mov ax,offset start
	     s:mov ax,offset s
codesg ends

end start