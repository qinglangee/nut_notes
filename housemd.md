  vim: ft=markdown   
# 常用命令

已停止更新，作者推荐  greys-anatomy  https://github.com/oldmanpushcart/greys-anatomy
## 启动

    $ java -Xbootclasspath/a:$JAVA_HOME/lib/tools.jar -jar housemd_x.x.x-x.x.x.min.jar [OPTIONS] <pid>
## 监控
### 查看方法执行的时间
```

```
# userGuide
UserGuideCN

HouseMD 是一款非常敏捷的Java进程运行时的诊断调式命令行工具, 它具备安全易用高效的特点, 让它非常适合在要求严格的线上(生产)环境中使用.
特性

    交互式命令行
        支持Tab自动补全或候选列表提示
        支持命令历史
    查看加载类
        支持跟踪文件来源路径
        支持跟踪类加载器层次
    跟踪方法
        支持类短名字(SimpleName)和方法名(可选)限定跟踪目标
        支持根据抽象类或接口来限定其实现类的跟踪目标
        支持实时显示跟踪目标的摘要统计
        支持输出跟踪目标调用日志文件输出
        支持输出跟踪目标调用栈文件输出
    查看环境变量
    查看对象属性值

为什么要有HouseMD

点击这里查看
与BTrace 相比

    仅一个jar包, 部署简单, 使用简单
    无需编写脚本, 借助指令完成常见诊断操作, 且切换快速高效
    借助命令行提示, 能够快速准确定位要跟踪的目标
    支持查看加载类的信息, 这在容器的应用诊断场景非常有用
    通过跟踪限时和限次数的机制, 来控制给跟踪过程带来的消耗
    自动检测并解决容器应用中类加载的问题
    自身源码精简短小, 易于阅读掌握, 易于定制扩展

安装

    Github已经不支持下载(https://github.com/blog/1302-goodbye-uploads), 所以原有安装方式已不被支持, 你只能通过编译源代码打包使用.

编译打包

在此之前需要有:

    JDK 6 +
    sbt

到命令行下, 执行下面的命令:

$ git clone https://github.com/zhongl/HouseMD.git housemd
$ cd housemd
$ sbt proguard

在target/scala-x.x.x/会生成一个名为 housemd_x.x.x-x.x.x.min.jar 可执行包.

    注意: 此版本尚不支持Windows, 欢迎你来帮大家实现.

运行

    $ java -Xbootclasspath/a:$JAVA_HOME/lib/tools.jar -jar housemd_x.x.x-x.x.x.min.jar [OPTIONS] <pid>

    注意: 在 Mac OSX, -Xbootclasspath 可以不要.

    建议根据上面的命令行创建一个启动脚本, 方便日后使用.

入门
启动

假定你创建了一个名为housemd的启动脚本, 并将它配置到了 PATH 中, 在命令行输入:

> housemd -h

你会看到HouseMD的帮助信息, 如下：

    Usage: housemd [OPTIONS] pid
    a runtime diagnosis tool of JVM.
    Options:
        -h, --help
            show help infomation of this command.
        -p, --port=[INT]
            set console local socket server port number.
            default: 54321
    Parameters:
        pid
            id of process to be diagnosing.

真正要用起来, 则需要拿到你要诊断的java进程的ID（通过jps或ps）, 假设pid是1234, 然后执行:

> housemd 1234

帮助

在显示若干行INFO信息后, 此时进入HouseMD的Shell提示符, 键入help指令, 可以查看其支持的内置指令:

housemd> help

quit       terminate the process.
help       display this infomation.
trace      display or output infomation of method invocaton.
loaded     display loaded classes information.
env        display system env.
inspect    display fields of a class.

在help后加上指令的名字, 如loaded, 便会显示具体指令的帮助信息:

    housemd> help loaded
    Usage: loaded [OPTIONS] name
        display loaded classes information.
    Options:
        -h, --classloader-hierarchies
            display classloader hierarchies of loaded class.
    Parameters:
        name
            class name without package name.

退出

    键入quit指令
    键入Ctrl + D

告诉我们你在用

真诚的感谢每位关注和使用HouseMD的朋友, 若HouseMD有帮助到你, 那就请来这儿留名, 说不定你还能发现你身边的朋友也在使用, 不如和他们一起来分享, 一起来吐槽, 一起来贡献.
常见问题解答

点击这里查看
指令范例
loaded

housemd> loaded String
java.lang.String -> /usr/lib/jvm/java-6-sun-1.6.0.26/jre/lib/rt.jar

    查看类java.lang.String的加载路径

housemd> loaded -h ScalaObject
scala.ScalaObject -> /home/housemd/housemd.jar
    - com.github.zhongl.housemd.Duck$1@1e859c0
        - sun.misc.Launcher$AppClassLoader@1cde100
            - sun.misc.Launcher$ExtClassLoader@16f0472

    查看类scala.ScalaObject的加载路径和类加载器层次.

    注意: BootClassLoader由于不是Java语言实现, 所以不会显示.

trace

    housemd> trace -t 2 TraceTarget$A.m
    INFO : probe class TraceTarget$A
    TraceTarget$A.m(int, String)    TraceTarget$CL@42719c            0            -ms    [Static Method]
    TraceTarget$A.m(String)         TraceTarget$CL@42719c            2            3ms    TraceTarget$A@401369

    TraceTarget$A.m(int, String)    TraceTarget$CL@42719c            0            -ms    [Static Method]
    TraceTarget$A.m(String)         TraceTarget$CL@42719c            4            1ms    TraceTarget$A@401369

    INFO : Ended by timeout
    INFO : reset class TraceTarget$A

    跟踪接下来2秒内TraceTarget$A.m方法的调用

    每列的含义依次是: 方法全名(含参数列表), 当前类的加载器对象, 总计调用次数, 平均调用耗时, 调用的自身对象

housemd> trace -l 4 TraceTarget$D+.mD1
INFO : probe class TraceTarget$D
TraceTarget$D.mD1(int)    TraceTarget$CL@42719c            2           <1ms    TraceTarget$B@80cac9

INFO : Ended by overlimit
INFO : reset class TraceTarget$D

    跟踪接下来4次抽象类TraceTarget$D的mD1方法的调用

    这里可以看到, 这个方法调用的触发对象是其实现类TraceTarget$B的实例

housemd> trace -i 4 TraceTarget$D+
INFO : probe class TraceTarget$D
INFO : probe class TraceTarget$B
TraceTarget$B.mC(String)       TraceTarget$CL@42719c            8           <1ms    TraceTarget$B@80cac9
TraceTarget$B.mD2(int, int)    TraceTarget$CL@42719c            8           <1ms    TraceTarget$B@80cac9
TraceTarget$D.mD1(int)         TraceTarget$CL@42719c            8           <1ms    TraceTarget$B@80cac9

TraceTarget$B.mC(String)       TraceTarget$CL@42719c           16           <1ms    TraceTarget$B@80cac9
TraceTarget$B.mD2(int, int)    TraceTarget$CL@42719c           16           <1ms    TraceTarget$B@80cac9
TraceTarget$D.mD1(int)         TraceTarget$CL@42719c           16           <1ms    TraceTarget$B@80cac9

INFO : Ended by timeout
INFO : reset class TraceTarget$D
INFO : reset class TraceTarget$B

    跟踪抽象类TraceTarget$D所有方法的调用, 设定每隔4秒进行一次实时摘要显示, 直至默认结束条件达成

housemd> trace -d TraceTarget.addOne TraceTarget$A
......
INFO : You can get invocation detail from /tmp/trace/19987@hostname/detail

    跟踪TraceTarget.addOne方法和 TraceTarget$A的所有方法的调用, 并输出详细日志到文件

输出的detail文件内容:

2012-06-14 14:38:29 8ms [main] null TraceTarget.addOne [0] 1
2012-06-14 14:38:29 2ms [main] TraceTarget$A@995a79 TraceTarget$A.m [123] void
2012-06-14 14:38:30 0ms [main] null TraceTarget.addOne [0] 1
2012-06-14 14:38:30 0ms [main] TraceTarget$A@995a79 TraceTarget$A.m [123] void

    日志每行以一个空格分隔, 每列的含义依次是: 日期, 时间戳, 调用耗时, 调用线程名, 调用方法的自身对象, 调用方法全名, 调用方法参数值列表, 返回值(或异常)

housemd> trace -s TraceTarget.addOne
......
INFO : You can get invocation stack from /tmp/trace/19987@hostname/stack

    跟踪TraceTarget.addOne方法, 并输出其调用栈到文件

输出的stack文件内容:

TraceTarget.addOne(Integer) call by thread [main]
    TraceTarget.main(TraceTarget.java:42)

env

housemd> env USER
USER = housemd

    查看环境变量USER的值

housemd> env -e T.*
TERM                = xterm
TYPESAFE_STACK_HOME = /home/housemd/

    查看所有以T开头的环境变量的值

inspect

housemd> inspect -l 1 TraceTarget$B.s
INFO : Probe class TraceTarget$B
TraceTarget$B.s 123 TraceTarget$B@1687e7c TraceTarget$CL@42719c

INFO : Ended by overlimit
INFO : Reset class TraceTarget$B

    查看TraceTarget$B属性名为s的值

    实时显示的行记录每列的含义依次是： 属性全名， 属性值， 自身对象实例 ， 此类的类加载器

更多信息请见常见问题解答, 或指令帮助
历史版本和未来规划

点击这里查看
疑问, 建议, 缺陷

欢迎任何疑问, 建议还有缺陷, 请至这里提交给我.
参与贡献

请仔细阅读开发指南.
后记

HouseMD是基于字节码技术的诊断工具, 因此除了Java意外, 任何最终以字节码形式运行于JVM之上的语言, HouseMD都支持对它们进行诊断, 如Clojure(感谢@Killme2008提供了它的使用入门)), scala, Groovy, JRuby, Jython, kotlin等.

感谢使用HouseMD, 祝你玩得开心~ :)

Last edited by zhongl, 7 days ago

