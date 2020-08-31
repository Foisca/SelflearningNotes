

# 时间和日期

1. date

    >1. date : display current time
    >2. date+%Y : display current year
    >3. date+%m : display current month
    >4. date+%d : display current day
    >5. date"+%Y-%m-%d %H:%M:%S" : display current year,month,day,hour,minute,second

2. date -s "current time"

    >set the system time
    >data -s "2020-05-30 12:00:00"

3. cal -[option]

    >view the current month calender
    >
    >>cal 2020 : display year 2020 calender

# 搜索

1. find [search scope] [option] "string"

    >options
    >
    >1. -name : 
    >2. -user : 
    >3. -size +(' ' or -)n, unit : K M
    >
    >>string : wildcards supported

2. locate "file"

    >quickly find the find, but need to update the database
    >run the command : **updatedb**

3. grep -[option] content "srcfile"

    >pipline symbol '|' : output the processing result of the previous command to the following command processing
    >filter search
    >
    >>-n : display the line number
    >>-i : ignore letters' case

    # <center>File and Directory</center>

    1. pwd

        >echo the path now

    2. ls -[option] 

        >display subordinate directory
        >
        >>-l -> list
        >>-a -> all

    3. cd -[option] [path]

        >go to the specified directory
        >
        >>cd .. -> return to the last directory
        >>cd ~ or cd -> go to the home directory
        >>cd / -> go to the root directory

    4. mkdir -[option] "dirname"

        >-p -> make multilevel directories

    5. rmdir -[option] "dirname"

        >remove an **empty** directory
        >
        >>if the directory is not empty:
        >>**rm -rf "dirname“**

    6. touch "file1" ["file2" ...]

        >create an empty file

    7. cp -[option] src dstpath

        >-r : recursion, copy the whole folder

    8. rm -[option] "name"

        >remove a file or directory
        >-r : recursion
        >-f : force

    9.  mv -[option] "name" dstpath

        >function
        >
        >1. move a file or directory to another path (cut)
        >2. **rename** a file or directory

    10. cat -[option] "filename"

        >**readonly**: view the file content but cannot modify the file
        >
        >>-n : display line number
        >>cat "filename" | **more** : to read the file page by page

    11. more "filename"

        >view a **whole** file with VI

    12. less "file"

        >view a **fraction** of the file

    13. \> : output redirects & \>\> : append

        >\> : rewrite, cover the original content
        >\>\> : append, add some content to a file
        >
        >1. ls -l > "file"
        >
        >>write the content of command "ls -l" to the "file"(cover the original file or create a new file)
        >
        >2. ls -al >> "file"
        >
        >>append the content of coommand to the "file"
        >
        >3. cat "file1" > "file2"
        >
        >>copy the content of "file1" to "file2", cover the original content of "file2"
        >
        >4. echo "content" >> "file"

    14. echo -[option] [content]

        >output content on the console
        >
        >>Practicla useage : 
        >>
        >>1. echo the environment variable
        >>2. echo the environment path

    15. head -[option] "file"

        >view the begining of the file
        >
        >>-n 5 : view the first 5 lines of the file (default 10 lines)

    16. tail -[option] "file"

        >veiw the tail of the file
        >
        >>-n 5 : view the last 5 lines of the file (default 10 lines)
        >>-f (**regular use**) :  Real-time tracking of all updates to the modified document

    17. ln -s [src file or dir] [softlink name]

        >soft link : create a shortcut

    



# 用户管理

1. useradd "username"

    >add a user and create a group named "username"

2. groupadd "groupname"

    >add a group named "groupname"

3. usradd -g "groupname" "username"

    >add a user to a group 

4. userdel "username"

    >delete a user

5. groupdel "groupname"

    >delete a group

6. id "username"

    >query a user

7. su - "username"

    >change user
    >
    >> "exit" to exit
    >> ###<center>Documents for users and groups</center>

8. /etc/passwd

    >users' configuration file
    >
    >>username:Command:userid:groupid:homedir:Shell

9. /etc/group

    >groups' configuration file
    >
    >>groupname:command:groupid:usersingroup(invisable)

10. /etc/shadow

    >passwod configuation(encrypted)

# 系统运行级别

0. shutdown
1. single user
2. multi-user networkless services
3. multi-user network services
4. reservations
5. graphical interface
6. reboot
    **configration file:**

>/etc/inittab

**change run level:**

>init [0123456]

**one problem**

>How to find the missing root password?
>
>>solution:
>>Enter Single User Mode (root password is not required to enter) and then change the root password
>>
>>>Premise: Cannot be modified remotely

# 包

## rpm包的管理

### rpm包的简单查询指令:

查询已安装的rpm列表

> rpm -qa | grep xx

### rpm包的其他查询指令:

|         指令         |         作用         |
| :------------------: | :------------------: |
|   rpm -qa \| more    | 查询所有安装的rpm包  |
|  rpm -qa \| grep X   |       分页显示       |
|   rpm -q 软件包名    | 查询软件包名是否安装 |
|    rpm -q firefox    |                      |
|   rpm qi 软件包名    |    查询软件包信息    |
|     rpm qi file      |                      |
|   rpm -ql 软件包名   |  查询软件包中的文件  |
| rpm -qf 文件全路径名 |  查询文件所属软件包  |

### 卸载rpm包

基本语法

> rpm -e rpm包名
>
> rpm -e --nodeps rpm包名 #强制删除

### 安装rpm包:

基本语法:

>rpm -ivh rpm包全路径名称
>
>i=install	安装
>
>v=verbose	提示
>
>h=hash	   进度条

## yum

yum包是一个shell前端软件包管理器. 基于rpm包管理,能够从指定的服务器自动下载rpm包并且安装,可以**自动处理依赖性关系**,并且一次安装所有依赖性的软件包.

### yum的基本指令

#### 查询yum服务器是否有需要安装的软件

> yum list | grep xx软件列表

#### 安装指定的yum包

>yum install xxx   #下载安装

# 此时进程管理(重点)



### 基本介绍

1. 在Linux中,每个执行的额程序(代码)都称为一个进程,每个进程都分配一个ID号
2. 每一个进程,都会对应一个父进程,而这个父进程可以复制多个子进程.例如www服务器
3. 每个进程都可能以两种方式存在. 前台和后台, 所谓前台进程就是用户目前的屏幕上可以进行操作的; 后台进程则是实际在操作,但是屏幕上无法看到的进程
4. 一般系统的服务都是以后台进程的方式存在的，而且都会常驻在系统中，直到关机才结束

ps命令是用来查看当前系统中，有哪些增在执行，以及它们的执行状况。

|  字段   |           说明           |
| :-----: | :----------------------: |
|   PID   |        进程识别号        |
|   TTY   |         终端机号         |
|  TIME   |  此进程所消耗的CPU时间   |
| COMMAND |   进程启用时命令行位置   |
|   VSZ   |    使用的虚拟内存(KB)    |
|   RSS   |    使用的物理内存(KB)    |
|  STAT   | 进程状态. s:休眠，r:运行 |

ps -a	显示当前终端所有进程信息

ps -u	以用户的格式显示进程信息

ps -s	显示后台进程运行的参数

ps -ef    查看父进程(PPID)



### 终止进程kill 和 killall

若是某个进程执行一半需要停止时,或是已经消耗了很大的系统资源时,此时可以考虑停止改进程, 使用kill来完成此项任务.

基本语法

```shell
kill [选项] 进程号
killall 进程名称 

常用选项:-9 表示强迫停止进程
```

### 查看进程树

基本语法

pstree [选项] ,可以更加直观看进程信息

常用选项

-p : 显示进程PID

-u : 显示进程所述用户

### 服务(service)管理

服务本身就是进程,但是运行在后台,通常会监听某个端口,等待其他程序的请求,比如mysql, sshd防火墙等. 因此我们又称为守护进程, 是Linux中非常重要的知识点

#### service**管理指令**

```
service 服务名 start | stop |restart | reload | status
systemctl
```

#### 实用案例



> service iptables status   #查看防火墙状态
>
> service iptables status   #关闭防火墙
>
> service iptables start    #开启防火墙
>
> 以上都是临时的,重启后刷新

**可以通过windows的telnet指令来检测Linux某个端口是否可以访问**

> telnet IP 端口

#### 查看服务

1. 使用setup指令

    > setup

2. /etc/init.d/服务名称

    > ls /etc/init.d

#### chkconfig 指令

通过chkconfig命令可以给每个服务的各个运行级别设置自启动/关闭

基本语法

1. 查看服务

    > chkconfig --list | grep xxx

2. chkconfig 服务名 --list

3. chkconfig --level 0-6 服务名 on/off

#### 应用实例:

1. 请显示当前系所有服务的各个运行级别的运行状态

    > chkconfig --list

2. 请查看sshd服务的运行状态

    > service sshd status

3. 将sshd服务在运行级别5下设置为不自动启动

    > chkconfig --level 5 sshd off

4. 当运行级别为5时,关闭防火墙

    > chkconfig --level 5 iptables off

5. 在所有运行级别下,关闭防火墙

    > chkconfig iptables off

6. 在所有运行级别下,开启防火墙

    > chkconfig iptables on

注意: chkconfig重新设置服务后,需要重启才能生效



### 动态监控进程

top与ps相似,他们都来显示正在执行的进程. top和ps最大的不同在于top在执行时间可以跟新正在运行的进程

基本语法

>  top [选项]

选项说明

|  选项   |                             功能                             |
| :-----: | :----------------------------------------------------------: |
| -d 秒数 | 指定top命令每隔几秒更新,默认3,在top命令交互式模式中可以执行的命令 |
|   -i    |               使top不显示任何闲置或者僵尸进程                |
|   -p    |          通过指定监控进程ID来仅仅监控某个进程的状态          |



| 操作 |         功能         |
| :--: | :------------------: |
|  P   |   以CPU使用率排序    |
|  M   |  以内存的使用率排序  |
|  N   |      以PID排序       |
|  Q   |       退出top        |
|  u   | 查询用户名相关的进程 |
|  k   |    杀死PID的进程     |



### 监控网络状态

#### 查看网络情况netstat(重要)

基本语法

> netstat [选项]

选项说明

> -an 按一定顺序排列输出
>
> -p 显示哪个进程在调用

应用案例

* 查看系统所有网络服务

> netstat -anp

* 查看sshd(特定)服务

> netstat -anp | grep sshd(特定名称)

## crond任务调度

任务调度,是指系统在某个时间执行的特定的命令或程序.

任务调度分类:

1. 系统工作;有些重要的工作必须周而复始地执行,例如病毒扫描等
2. 个别用户工作,个别用用户可能希望执行某些程序,比如对mysql数据库备份.

基本语法:

​	crontab [选项]

| 选项 | 作用                          |
| ---- | ----------------------------- |
| -e   | 编辑crontab定时任务           |
| -l   | 查询crontab任务               |
| -r   | 删除当前用户所有的crontab任务 |

5个占位符的说明

| 项目     | 含义               | 范围               |
| -------- | ------------------ | ------------------ |
| 第1个"*" | 一小时中的第几分钟 | 0-59               |
| 第2个"*" | 一天中的第几小时   | 0-23               |
| 第3个"*" | 一个月中的第几天   | 1-3                |
| 第4个"*" | 一年中的第几个月   | 1-12               |
| 第5个"*" | 一周中的星期几     | 1-7(0,7都是星期日) |



特殊字符说明

| 特殊符号 |                             含义                             |
| :------: | :----------------------------------------------------------: |
|    *     |      代表任意时间.比如第一个*代表一小时每分钟都执行一次      |
|    ,     | 代表不连续的时间,比如"0 8,12,16* * *"命令,代表在每天8点0分,12点0分,16点0分都执行一次命令 |
|    -     | 代表连续的时间范围,比如"0 5* *1-6"命令,代表在周一到周六的林晨5点0分执行命令 |
|   */n    | 代表每隔多久执行一次.比如"\*/10* * * * \*"命令,代表每隔10分钟执行一遍命令 |

特定时间执行任务案例

|        时间        |                             含义                             |
| :----------------: | :----------------------------------------------------------: |
| 45 22 * * *   命令 |                        在22:45分执行                         |
| 0 17 * * 1    命令 |                      每周一17:00分执行                       |
| 0 5 1,15 * * 命令  |                  每月1到15号凌晨5:00分执行                   |
| 40 4 * * 1-5 命令  |                    每周一到五凌晨4:40执行                    |
| */10 4 * * * 命令  |                每天凌晨4点,每隔10分钟执行一次                |
| 0 0 1,15 * 1 命令  | 每月1和15号,每周一的00:00都会执行命令.注意:星期几和几号最好不要同时出现,因为他们定义的都是天,非常容易让管理员混乱 |

几个应用案例

1. 每隔1分钟,将当前日期信息追加到/tmp/mydate 文件中

    1. 编写一个文件mytask.sh

    2. 给mytask.sh一个可执行的权限

        chmod 744

    3. crontab -e */1 * * * *  /home/mytask.sh

    

```shell
//mytask.sh
date >> /tmp/mydate

```

# 磁盘分区和挂载

### 分区的方式

1. MBR分区
    1. 最多支持四个主分区
    2. 系统只能安装在主分区
    3. 拓展分区只要占一个主分区
    4. MBR最大支持2TB,但有用最好的兼容性
2. GPT分区
    1. 支持无限多个主分区(但操作系统可能限制,日入windows下最多128个分区)
    2. 最大支持18EB的容量(EB=1024PB,PB=1024TB)
    3. windows7 63位以后支持GPT

### Linux分区

1. Linux无论有几个分区,分给哪一个目录使用,归根到底就只有一个根目录, 一个堵路且唯一的文件结构.Linux中每个分区都是用来组成整个系统文件的一部分.
2. Linux采用了一种加"载入"的处理方法, 它的整个文件系统中包含了一整套的文件和目录, 且将一个分区和一个目录联系起来, 这时要载入的一个分区将使它的存储空间在一个目录下获得.

```
# lsblk [-f]   ->查看分区情况
```

增加一块硬盘

1. 虚拟机添加硬盘
2. 分区    fdisk /dev/sdb
3. 格式化  mkfs -t ext4 /dev/sdb1
4. (临时)挂载   先创建一个 /home/newdisk  挂载: mount /dev/sdb1 /hoome/newdisk
5. (永久)设置可以自动挂载 vim /etc/fstab  , 修改一些内容



### 磁盘情况查询

1. 磁盘整体使用情况

    基本语法

    > df -lh

2. 查询指定目录的磁盘占用情况

    基本语法

    > du -h 目录
    >
    > -s 指定目录占大小汇总
    >
    > -h 带计量单位
    >
    > -a  含文件
    >
    > --max-depth=1  子目录深度
    >
    > -c 列出明细的同事,增加汇总值

常用实用指令

1. 统计/home文件夹下文件个数

    > ls -l /home | grep "^-" | wc -l

2. 统计/home文件夹下目录个数

    > ls -l /home | grep "^d" | wc -l

3. 统计/home文件夹下文件的个数, 包括子文件夹例的

    > ls -lR /home | grep "^-" | wc -l

4. 统计文件夹下目录的个数,包括子文件夹里的

    > ls -lR /home | grep "^d" | wc -l

5. 以树状显示目录结构

    > yum install tree
    >
    > sudo apt-get install tree
    >
    > tree [目录]





