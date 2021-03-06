# <center>TCP/IP</center>

Golang的主要设计目的之一就是面向大规模后端服务程序，网络通信这块是服务端程序必不可少的也是至关重要的一部分

**网络编程有两种:**
1. TCP SOCKET编程,是网络编程的主流,之所以叫TCP socket编程,是因为底层是基于TCP/IP协议的,比如:QQ
2. b/s结果的HTTP编程,我们使用浏览器去访问服务器时,使用的就是HTTP协议,而http底层依旧是Tcp socket实现的.例如:京东商城
_每台电脑都有自己的TCP/IP号_

## **TCP/IP 经典书:**

1. TCP/IP详解,卷一,协议
2. TCP/IP详解,卷二,实现
3. TCP/IP详解,卷三,TCP事物协议HTTP NNTP和UNIX协议

计算机之间要相互通讯,就必须要求网线,网卡或者时无线网卡

TCP/IP (Transmission Control Protocl/Internet Protocl) : 传输控制协议/因特网互联协议,又称网络通讯协议.这是协议时Internet最基本的协议,Internet国际互联网络的基础,简单地说,就是由网络层的IP协议和传输层的TCP协议组成.

|**Osi模型(理论)**   |**TCP/IP模型(现实)** |
|       :-:        |          :-:         |
|应用层(Application)|smtp,ftp,telnet,http  |
|表示层(Presention  |                      |
|会话层(Session)    |                      |
|传输层(transport)  |解释数据               |
|网络层(IP)         |定位IP地址和确定链接路径|
|数据链路层(Link)   |与硬件驱动对话          |
|物理层(Physical)   |                      |

## IP地址

每个Internet上的主机和路由器都有要给IP地址,包括了网络号和主机号

1. IPV4(32位)
2. IPV64(128位)
3. 端口(port)
    >1. 这不是实际意义上的端口,时逻辑上的端口,端口就是其他程序再该服务器的通道
    >2. 只要是做服务程序的,都必须监听一个端口
    >3. 一台电脑有65535个端口(256^2-1)
    >4. 一旦应给端口被某个程序监听了,那么其他程序不能再该端口监听
    > 5. 客户端和其他程序端口对接,自己也随机分配一个端口

#### 端口的特点:

* 0是保留端口
* 1-1024是固定端口,又称有名端口,被某些程序固定使用,一般程序不可使用
   >7: echo服务
   >21: ftp使用
   >22: SSH远程登陆协议
   >23: telnet使用
   >25: smtp服务使用
   >80: iis使用
* 1025-65535是动态端口,我们可以使用

TCP是常连接
HTTP是短连接

#### 服务器端的处理流程

1. 监听端口 8888
2. 就收客户端TCP链接,建立客户端和服务器端的链接
3. 创建goroutine,处理该链接的请求(通常客户端会通过链发送请求包)

### 客户端处理流程

1. 建立与服务器的链接
2. 发送请求数据,接收服务器端返回的结果数据
3. 关闭连接