# LearningAssemblyLanguage
> 2020年5月7日更新
> 这次主要更新了配套的汇编语言书籍，这个版本非网上下载的扫描版本，而是某泉学堂直接原始文稿生成的版本，全网清晰度质量最高，如果喜欢纸质版请支持正版自行购买。
> 配套课件：
> 链接:https://pan.baidu.com/s/13SHb30Ou3hIaeC3K-Dya6A 提取码:vqqv 
> 复制这段内容后打开百度网盘手机App，操作更方便哦
> 配套书籍：
> 链接: https://pan.baidu.com/s/178P7pxsQu4c67mEYnWa3QQ 提取码: 2ncu 
> 复制这段内容后打开百度网盘手机App，操作更方便哦

## day01

### p1 1.1视频使用指南

### p2 1.2 视频通知2019年7月25日

### p3 2.1DosBox下载和安装

#### 配置DosBox.exe和Debug.exe

##### 工具包所在位置：

>LearningAssemblyLanguage\课程工具包\章节2\DosBox的下载安装与使用 MAC(差不多) WIN 7 WIN10 用户必看！

##### 安装DosBox.exe,分别点击next,next,install,close即可

![image-20220418220336922](./img/image-20220418220336922.png)

![image-20220418220351301](./img/image-20220418220351301.png)

![image-20220418220404530](./img/image-20220418220404530.png)

![image-20220418220417226](./img/image-20220418220417226.png)



##### 新建Asm文件夹

##### 复制debug.exe到文件夹Asm下，debug.exe的具体路径为

![image-20220418221829232](./img/image-20220418221829232.png)

##### 双击打开软件

![image-20220418222120486](./img/image-20220418222120486.png)

##### 打开后的软件页面的形式

![image-20220418222247972](./img/image-20220418222247972.png)

##### 打开DosBox0.74执行命令mount  c:  E:\CodeLibraries\LearningAssemblyLanguage\Asm(此处应该填写具体的路径，第二个参数)，再执行c:,再执行debug命令.

###### 相关代码

```
mount  c:  E:\CodeLibraries\LearningAssemblyLanguage\Asm
c:
debug
```

###### 执行的详细过程

![image-20220418222817047](C:\Users\TS\AppData\Roaming\Typora\typora-user-images\image-20220418222817047.png)

###### 可以输入d命令，可以看到如下输出

![image-20220418223401609](./img/image-20220418223401609.png)

#### 通过配置文件避免复杂重复的劳动

##### 在上面配置DosBox.exe和Debug.exe的时候，我们执行了三个命令 mount、c:、debug，其实我们可以通过配置文件来简化上述操作不然每次都需要这样来操作，才能进入相应的环境

###### 配置的方法如下

1、通过DosBox Status Window找到conf所在路径

![image-20220418223935970](./img/image-20220418223935970.png)

2、找到dosbox-0.74.conf之后，底部添加如下内容即可

```
mount  c:  E:\CodeLibraries\LearningAssemblyLanguage\Asm
c:
```

![image-20220418224314989](./img/image-20220418224314989.png)

3、双击打开文件

![image-20220418222120486](./img/image-20220418222120486.png)

4、执行debug命令

![image-20220418224509466](./img/image-20220418224509466.png)

## day02

### p4 Vim文本编辑器下载安装和配置

### p5 Win10 Vim说明

### p6 源代码的编译和链接，将源码生成最终的exe然后执行

#### 在视频的参考资料中，都有如下文件，拷贝到文件夹Asm下

![image-20220419015843954](./img/image-20220419015843954.png)

#### 在Asm文件夹下新建t1.asm文件，将temp.txt中的内容复制过去

#### 执行命令 masm t1 ;link t1

![image-20220419020536692](./img/image-20220419020536692.png)

![image-20220419020633722](./img/image-20220419020633722.png)

#### 执行程序T1.EXE

![image-20220419021127667](./img/image-20220419021127667.png)