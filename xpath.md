# xpath 使用
[XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)](https://www.w3.org/TR/xquery-operators/)  
[xpath选择器](http://www.cnblogs.com/jenniferhuang/p/3392203.html)  
[JsoupXpath](http://jsoupxpath.wanghaomiao.cn/)  

##　xpath中选取节点的路径表达式
/  绝对路径
// 相对路径
.  选取当前节点
..  选取当前节点的父节点
@ 选取属性
## xpath中“谓语”

放在[]中的几种查找方式写法如下：
`//ul/li[1]` , 表示选择 ul多个li子元素中的第一个
`//ul/li[last()]`， 表示选择ul子元素中的最后一个li元素
`//ul/li[last()-1]`， 表示选择ul子元素中的倒数第二个li元素
`//ul/li[position()<3]`，表示选取最前面2个属于ul元素的li子元素
`//a[@href]` ，表示选取只要含有href属性的a元素
`//a[@href='http://www.cnblogs.com/jenniferhuang']` ，属性值完全匹配
`//input[contains(@id,'quantityTextBox')]`， 当属性值部分匹配时，插入函数的写法

`//a/text()`    取链接中的文字
`text()` 提取节点的自有文本
`node()` 提取所有节点
`position()` 返回当前节点所处在同胞中的位置
`last()` 返回同级节点中的最后那个节点
`first()` 返回同级节点中的第一个节点



## xpath函数

函数被分成四类

节点集函数:    `last(), position()`,
字符串函数:   `contains(),  substring(@class,'abc')="",  substring-before(), substring-after(),  string-length()`
布尔函数:  
数字函数:

reference : http://www.cnblogs.com/cxd4321/archive/2007/09/24/903869.html  SearchKkeyword: "核心函数库"

## xpath轴  

 轴名称             结果

ancestor           选取当前节点的所有先辈（父、祖父等）
ancestor-or-self   选取当前节点的所有先辈（父、祖父等）以及当前节点本身
descendant         选取当前节点的所有后代元素（子、孙等）
descendant-or-self 选取当前节点的所有后代元素（子、孙等）以及当前节点本身
parent             选取当前节点的父节点
child              选取当前节点的所有子元素
following          选取文档中当前节点的结束标签之后的所有节点
preceding          选取文档中当前节点的开始标签之前的所有节点
preceding-sibling  选取当前节点之前的所有同级节点
attribute          选取当前节点的所有属性
namespace          选取当前节点的所有命名空间节点
self               选取当前节点

## 应用举例

 1、定位某个节点，该节点包含有一已知的特定后代节点
`//table[contains(@class,'orderHistoryBox') and descendant::dd[text()='11132789']]`
2、定位一已知节点的某一先辈节点
`//dd[text()='11132789']//ancestor::table[contains(@class,'orderHistoryBox')]（与1效果相同）`
3、不包含的写法
`//table[@id='wizards-ivrKeyPressAssignment-extSelectorForm-mailbox-field']/tbody/tr[not(contains(@class,'x-hidden'))][5]`
4、注意class的取用：
`//*[contains(@id,'userCallForwarding/rules-hoursSelector-tabBar-root-item') and contains(@class,'textTabButtonSelected')]`
该class可以不是当前id''userCallForwarding/rules-hoursSelector-tabBar-root-item'' 下的class，可以是其包含标签内其他元素的class
