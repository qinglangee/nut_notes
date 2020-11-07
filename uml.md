# uml 基础功参
软件 比较出名的一个  plantUML 
[介绍地址](https://zhuanlan.zhihu.com/p/76948461)  
[类图符号][1]  

# 语法


# plantUML 语法
开始 结束
```uml
@startuml
@enduml
```

## [类图语法][1]
```uml
箭头方向可以换过来
<|--  Extension 扩展
*--   Composition 组合
o--   Aggregation 聚合  
..    直接连接
--    直接连接

使用 .. 来代替 -- 可以得到点线

一些其他的箭头形式
#--
x--
}--
+--
^--
<--

"a"-->"b"  用引号可以在箭头的两边添加文字说明  Class1 "many"-->"one"  Class2

在标签的开始或结束位置添加 > 或 < 以表明是哪个对象作用到哪个对象上
Driver - Car : drives >
Car *-- Wheel : have 4 >
Car -- Person : < owns

添加字段或方法，可以使用后接字段名或方法名。 系统检查是否有括号来判断方法还是字段
ArrayList : Object[] elementData
ArrayList : size()

也可以使用{}把字段或方法括起来
class Dummy{
    String data
    void methods()
}

class Flight{
    flightNumber : Integer
    departureTime : Date
}

定义可访问性 
- private
# protected
~ package private
+ public

可以采用以下命令停用符号的图片化  
@startuml
skinparam classAttributeIconSize 0
class A{
    - field01   这个就会显示字符 - ， 不会显示图标
}
@enduml

通过修饰符 {static} 或者 {abstract}, 可以定义静态或抽象方法或者属性 
{static} String id

自定义分隔线
--
..
==
__

.. String id ..

String id
..
String name


抽象类和接口
abstract 来定义抽象类  interface 定义接口  

abstract Class01
interface Class02

package 包 , 还可以指定显示的背景色
package net.sourceforage.plantuml #ddffee  

namespace 命名空间，跟包有区别。 包中的类不能同名。  

```


## 示例
```uml
class Class01{
    - field01
}

```




[1]: https://plantuml.com/zh/class-diagram