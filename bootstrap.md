# bootstrap 快速开始

# 第一次使用 
1. 先是 head 中的三个 meta 标签 
2. 引入 css 
    `<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">`

3. 在页面最后加载 jquery 和 bootstrap 的 js 。
`    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js">`

4. 可以开始在页面中使用 bootstrap 的类了。 

5. 具体用法查看实例列表
    https://v3.bootcss.com/getting-started/#template


# 主要功能 

所有要被 bootstrap 控制的内容放在 .container 中，container 有设置 before after. 

## CSS 

### 栅格布局系统   
随着视口尺寸增加，系统会自动分为最多*12*列。  
.row
.col-md-数字  `.col-*-*` 放 `.row` 中,   
    也有的放 `.form-group` 中，这需要 form 元素设置 `role="form"`, `<input> <textarea> <select> 添加 class="form-control"`  
    .form-inline 内联表单(一行)   .form-horizontal  水平表单(标签和form元素结对一行)
    .has-success 控制各种颜色的
共分4级  xs(phones), sm(tablets), md(desktops), lg(large desktops)  

.col-md-offset-数字  直接在前面设置偏移(1-11)  
.col-md-push-*  .col-md-pull-*  比较迷的特性，不知道为啥要用  

## 组件 

### 按钮 btn
btn 基本按钮类
btn-lg btn-sm btn-xs  大小 - 从大到小。 不设置比 lg 小，比 sm 大 
btn-default btn-primary btn-success btn-info btn-warning btn-danger btn-link  按钮颜色 

### 表格 
table 基本 
table-striped  隔行颜色
table-boardered 加分界线  
table-condensed 压缩内容

### Label
label 
颜色部分与 button 相同

### 导航条
`<ul class="nav nav-pills" role="tablist">
    <li class="active" role="presentation">`

## jquery 插件











# 进行一些定制化 

## 禁止响应式布局 

1. 移除 此 CSS 文档中提到的设置浏览器视口（viewport）的标签：`<meta>`。
2. 通过为 .container 类设置一个 width 值从而覆盖框架的默认 width 设置，例如 width: 970px !important; 。请确保这些设置全部放在默认的 Bootstrap CSS 文件的后面。注意，如果你把它放到媒体查询中，也可以略去 !important 。
3. 如果使用了导航条，需要移除所有导航条的折叠和展开行为。
4. 对于栅格布局，额外增加 `.col-xs-*` 类或替换掉 `.col-md-*` 和 `.col-lg-*`。 不要担心，针对超小屏幕设备的栅格系统能够在所有分辨率的环境下展开。


# 一些类的说明

## .container 类和.container-fluid 类
container-fluid 和 container 都是有 padding-left 和 padding-right 的。不同的是在 min-width:768px min-width:992px min-width:1200px container都设置了固定宽，而container-fluid 却一直都是 wodth:100% 详情见：https://www.cnblogs.com/leijing0607/p/7272843.html


1、.container类的div左右两边有一个15px的padding（内边距），container-fluid类没有内边距  
2、.container类在屏幕宽度小于等于767px的时候，宽度=屏幕宽度的，也就是100%，container-fluid类不管屏幕宽度大小，一直是100%  
3、屏幕宽768px：.container类的div左右出现了外边距margin=9px（左右padding依然是15px），container-fluid类宽度不管屏幕宽度大小，一直是100%。   
4、屏幕宽一直拉大（<1000px）：.container类的div左右外边距margin一直增大，padding值和子div的宽度不变，屏幕拉大的部分都作用于margin上了。.container-fluid类宽度不管屏幕宽度大小，一直是100%。   
5、屏幕拉大到1000px的时候，.container类的div左右外边距margin=15px，左右padding=15px。.container-fluid类宽度不管屏幕宽度大小，一直是100%。  
6、屏幕又继续拉大的时候，拉大的部分又全部作用于.container类的div左右外边距margin。.container-fluid类宽度不管屏幕宽度大小，一直是100%。  







