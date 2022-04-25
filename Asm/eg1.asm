; /*
;  * 在汇编语言中一种是汇编指令，一种是伪指令。汇编指令是有对应的机器码指令，可以被编译为机器指令
;  * 最终被cpu执行；伪指令是有编译器来执行的指令，伪指令没有对应的汇编指令，最终不被cpu执行，那么
;  * 伪指令是由谁来执行的， 伪指令是由编译器来执行的，编译器根据不同的伪指令进行相关的编译工作
; */

; /*
;  * 程序中出现了三种伪指令：
;  * 1. segment - ends
;  *      segment 和 ends指令是一对成对使用的伪指令。编写汇编程序时候一定会用到，segment说明一个段
;  *      的开始，ends说明一个段的结束。使用的格式为：
;  *          段名 segment
;  *             .....
;  *             .....
;  *          段名 ends
;  *      比如：下方代码
;  *          codesg segmeng
;  *              .......
;  *          codesg ends
;  *
;  * 2. end
;  *      end 是一个汇编语言是一个汇编语言程序的结束标记。如果碰到了伪指令end就结束对源程序的编译
;  *
;  * 3. assume 
;  *      这条伪指令的含义为"假设"，关联某一段寄存器和程序中某一个segment...ends定义的段关联
;  *      cs:codesg 表达的意义就是将 cs段寄存器和codesg段相互关联
; */

; /*
;  * 标号：除了汇编指令和伪指令外，还有一些标号如：codesg,abc
; */

; /*
;  * 程序的结构：
;  * 1.定义一个段，名称abc
;  *      abc segment
;  *      .....
;  *      abc ends
;  *
;  * 2.在abc段中写入我们的汇编指令
;  *      abc segment
;  *      mov ax,1
;  *      abc ends
;  *
;  * 3.指出程序在何时结束
;  *      abc segment
;  *      mov ax,1
;  *      abc ends
;  *      
;  *      end
;  *
;  *
;  *4.abc被当成代码段来使用，那么应该和cs寄存器联系起来（可能是因为cs:ip指向要执行的下一条指令）
;  *      assume cs:abc
;  *
;  *      abc segment
;  *      mov ax,1
;  *      abc ends
;  *      
;  *      end  
; */

; /*
; * 程序返回：
; *   以下两条代码是用来返回程序的，先不必深究，只要知道，程序的末尾需要加入这两条指令
; *    mov ax,4c00
; *    int 21H
; */

; /*
;  * 编译执行：
;  *  打开我们的dosBox
;  *  masm
;  *  输入源文件为eg1.asm
;  *  无需指定obj文件
;  *  <注意：注释需使用";">
;  *  之后会产生一个EG1.OBJ的文件
;  *  运行link
;  *  输入eg1 link会自动查找eg.obj文件
;  *  后面按回车就行（一直）
;  *  最后我们就会产生一个EG1.exe的可执行文件
; */

assume cs:codesg

codesg segment

    mov ax,0123h
    mov bx,0456h
    add ax,bx
    add ax,ax

    mov ax,4c00h
    int 21h

codesg ends

end
