# <center>REDIS</center>

1. Redis是一种NoSQL数据库,不是传统类型的数据库
2. Redis REmote DIctionary Server(远程字典服务器),Redis性能高,单机能够达到15w qps,通常适合做缓存,也可以持久化
3. 是完全开源免费的,高性能的(keyvalue)分布式内存数据库,基于内存运行并支持持久化的NoSQL数据库,是最热门的NoSQL数据库之一，也称为数据结构服务器

#### Redis的安装和基本使用

* 直接解压完就可以使用

###Redis核心组件
```
1. 解析指令
2. 做相应处理
```
<center>⬆ ⬇</center>
```
内存数据
string; hash; key-val; list; set; zset(有序集合)
```
Redis的五大数据类型：
String, Hash, List,Set, ZSet(sorted set)

Redis安装好后，默认有16个数据库，初始默认使用0号，编号是0~15

#### Redis基本使用

1. 添加key-val [set]
   
   >set key value
2. 查看当前redis的所有key [keys *
3. 获取key对应的值。 [get key]
4. 切换redis的数据库 [select index]
5. 查看当前数据库的key-val数量[dbsize]
6. 清空当前数据库的key-val和清空所有数据库的key-val [flushdb flushall]

### Redis数据类型和CRUD

#### 1. String介绍

>string是redis最基本的类型,一个key对应一个value.
>str1:="hello"
>str2:="world"
>string类型是二进制安全的.除了普通的字符串外,还可以存放图片等数据.
>redis中字符串vale最大是512M

String-CRUD
* `set [如果存在数相当于修改,不存在就是添加]/get/del`
* `setex(set with expire) 键秒值`
`

