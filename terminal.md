> OSX 的文件系统 
> OSX 采用的Unix文件系统，所有文件都挂在跟目录 / 下面，所以不在要有Windows 下的盘符概念。 
> 你在桌面上看到的硬盘都挂在 /Volumes 下。 
> 比如接上个叫做 USBHD的移动硬盘，桌面上会显示出一个硬盘图标，它实际在哪里呢？ 
> 在终端里执行 ls /Volumes/USBHD, 看看显示出的是不是这个移动硬盘的内容。 
> 根目录位置是 / 核心 Mach_kernel 就在这里， 
> 驱动所在位置 /Systme/Library/Extensions 
> 用户文件夹位置 /User/用户名 
> 桌面的位置 /User/用户名/Desktop 
> 文件通配符为星号 * 
> 注意：在 Unix系统中是区别大小写字符的，A.txt 不等于 a.txt。 
> 根目录标志 / 不是可有可无，cd /System 表示转到跟目录下的System中，而cd System 表示转到当前目录下的 System中。

*** 小技巧
  
**用 Tab 键自动补齐命令 
比如想到 /System 目录中去，输入 cd /Sy 然后按一下Tab 键，命令就会自动补齐成 cd /System**
#常用操作
```
Command+拖拽=剪切
Option+拖拽=复制
Command+Option+拖拽=快捷方式
```
#基本命令
## 目录操作
```
获得权限 
为了防止误操作破坏系统，再用户状态下时没有权限操作系统重要文件的，所以先要取得root权限 
sudo －s
```
```
ls 参数 目录名        
例: 看看驱动目录下有什么:
ls /System/Library/Extensions
参数 -w 显示中文，-l 详细信息，-a 包括隐藏文件
``` 
```
cd    
例：想到驱动目录下溜达一圈   
cd /System/Library/Extensions
```
```
mkdir 目录名     
例：在驱动目录下建一个备份目录 backup     
mkdir /System/Library/Extensions/backup
在桌面上建一个备份目录 backup    
mkdir /User/用户名/Desktop/backup
```
```
cp 参数 源文件 目标文件    
例：想把桌面的Natit.kext 拷贝到驱动目录中  
cp -R /User/用户名/Desktop/Natit.kext /System/Library/Extensions
参数R表示对目录进行递归操作，kext在图形界面下看起来是个文件，实际上是个文件夹。
把驱动目录下的所有文件备份到桌面backup
cp -R /System/Library/Extensions/* /User/用户名/Desktop/backup
```
```
rm 参数 文件   
例：想删除驱动的缓存  
rm -rf /System/Library/Extensions.kextcache     
rm -rf /System/Library/Extensions.mkext
参数－rf 表示递归和强制，千万要小心使用，如果执行了 rm -rf / 你的系统就全没了
```
```
mv 文件   
例：想把AppleHDA.Kext 移到桌面    
mv /System/Library/Extensions/AppleHDA.kext /User/用户名/Desktop
想把AppleHDA.Kext 移到备份目录中   
mv /System/Library/Extensions/AppleHDA.kext /System/Library/Extensions/backup
```
```
更改文件权限 
chmod 参数 权限 文件 
例：把驱动目录下所有文件设定到root读写，其他用户只读 
chmod -R 755 /System/Library/Extensions 
参数R 表示递归，755表示各用户的权限
``` 
```
更改文件属主 
chown 参数 用户:组 文件 
例：把驱动目录下的所有文件属主改成根用户 
chown -R root:wheel /System/Library/Extensions 
参数R 表示递归操作
``` 
```
修复整个系统中文件的权限 
diskutil repairpermissions / 
严格的说这不是一个unix 命令，而是osx一个软件，记得修改或添加的驱动就执行一次。
```
```
nano 文件名   
例：编辑natit Info.plist     
nano /System/Library/Extensions/Natit.kext/Info.plist
编辑完成后 用 Ctrl ＋O 存盘，Ctrl＋X 退出
```
```
运行脚本命令 
sh 脚本文件名
```
```
mvdir                        
移动或重命名一个目录                         
mvdir dir1 dir2
```
```
pwd                          
显示当前目录的路径名
```
```
ls                              
显示当前目录的内容                             
ls -la
```
```
man 命令名 
比如要看看 ls 命令的详细用法，执行 man ls
```
```
sed 
非交互方式流编辑器 
sed "s/red/green/g" filename
``` 
```
grep 
在文件中按模式查找 
grep "^[a-zA-Z]" filename
``` 
```
awk 
在文件中查找并处理模式 
awk '{print $1 $1}' filename
``` 
```
passwd 
修改用户密码 
passwd 
```
```
umask 
定义创建文件的权限掩码 
umask 027
``` 
```
chgrp 
改变文件或目录的所属组 
chgrp staff filename
``` 
```
xlock 
给终端上锁 
xlock -remote 
```
```
make 
维护可执行程序的最新版本 
make
``` 
```
touch 
更新文件的访问和修改时间 
touch -m 05202400 filename
``` 
```
dbx 
命令行界面调试工具 
dbx a.out
``` 
```
xde 
图形用户界面调试工具 
xde a.out
```

##文件操作
```
cat                                      
显示或连接文件                       
cat filename
```
```
od                                      
显示非文本文件的内容            
od -c filename
```
```
cp                                      
复制文件或目录                        
cp file1 file2
```
```
rm                                     
删除文件或目录                         
rm filename
```
```
mv                                    
改变文件名或所在目录               
mv file1 file2
```
```
find                                  
使用匹配表达式查找文件             
find . -name "*.c" -print
```
```
file                                  
显示文件类型                                
file filename
```
```
pg 
分页格式化显示文件内容 
pg filename 
```
```
more 
分屏显示文件内容 
more filename
``` 
##选择操作
```
head                              
显示文件的最初几行                       
head -20 filename
```
```
dircmp 
比较两个目录的内容 
dircmp dir1 dir2
``` 
```
tail                                 
显示文件的最后几行                       
tail -15 filename
```
```
cut                                
显示文件每行中的某些域                 
cut -f1,7 -d: /etc/passwd
```
```
colrm                            
从标准输入中删除若干列                  
colrm 8 20 file2
```

```
paste 
横向连接文件 
paste file1 file2

```
```
ln 
联接文件 
ln -s file1 file2
``` 
```
diff                                
比较并显示两个文件的差异                
diff file1 file2
```
```
sort                             
排序或归并文件
sort -d -f -u file1
```

```
uniq                           
去掉文件中的重复行
uniq file1 file2
```
```
comm                        
显示两有序文件的公共和非公共行              
comm file1 file2
```
```
wc                            
统计文件的字符数、词数和行数                    
wc filename
```
```
nl                             
给文件加上行号
nl file1 >file2
```

##进程操作
```
ps                           
显示进程当前状态
ps u
```
```
kill                         
终止进程
kill -9 30142
```
```
nice 
改变待执行命令的优先级 
nice cc -c *.c 
```
```
renice 
改变已运行进程的优先级 
renice +20 32768
``` 
##时间操作
```
date                    
显示系统的当前日期和时间
date
```
```
cal                                   
显示日历                                       
cal 8 1996
```
```
time                         
统计程序的执行时间                            
time a.out
```

##网络与通信操作
```
telnet                                  
远程登录                                 
telnet hpc.sp.net.edu.cn
```
```
rlogin                                 
远程登录                                 
rlogin hostname -l username
```
```
rsh                       
在远程主机执行指定命令                             
rsh f01n03 date
```
```
ftp                   
在本地主机与远程主机之间传输文件
ftpftp.sp.net.edu.cn
```
```
rcp                 
在本地主机与远程主机 之间复制文件               
rcp file1 host1:file2
```
```
ping                   
给一个网络主机发送 回应请求                   
ping hpc.sp.net.edu.cn
```
```
mail                          
阅读和发送电子邮件
mail
```
```
write                      
给另一用户发送报文
write username pts/1
```
```
mesg                    
允许或拒绝接收报文
mesg n
```

##Shell 命令              

```
history               
列出最近执行过的 几条命令及编号
history
```
```
r                         
重复执行最近执行过的 某条命令
r -2
```
```
alias                            
给某个命令定义别名
alias del=rm -i
```
```
unalias                     
取消对某个别名的定义
unalias del
```

##其它命令

```
uname                     
显示操作系统的有关信息
uname -a
```
```
clear                       
清除屏幕或窗口内容
clear
```
```
env                        
显示当前所有设置过的环境变量
env
```
```
who                       
列出当前登录的所有用户
who
```
```
whoami                  
显示当前正进行操作的用户
whoami
```
```
tty                         
显示终端或伪终端的名称
tty
```
```
stty                         
显示或重置控制键定义
stty -a
```
```
du                                  
查询磁盘使用情况                         
du -k subdir
df /tmp                          
显示文件系统的总空间和可用空间
```
```
w                                  
显示当前系统活动的总信息
```

 



 













