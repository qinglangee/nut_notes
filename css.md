  vim: ft=markdown
# tips

## css 圆角  
`border-radius: 15px;` 
[ css3 圆角][1]


## 文字换行
`.text_wrap{word-wrap:break-word;word-break:break-word;}`

## clear both
css3样式，直接放在元素上，后面就clear float,　可以代替放个　clear:both 的 div
`.clear-fix:after { display: table; content: ""; width: 0; clear: both; }`

## div 高度很小
div中子元素全是float时，父元素div上要加上`overflow:hidden;`, 否则高度不会被子元素撐开．



[1]: http://www.ruanyifeng.com/blog/2010/12/detailed_explanation_of_css3_rounded_corners.html