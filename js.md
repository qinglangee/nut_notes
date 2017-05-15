  vim: ft=markdown

# 语法

正则

    var a = /aa(\d+)cc/;
    if(a.test("aa77cc")){
        console.log(\1);
    }else{
        console.log(123)
    }

类型判断, 详情见 wordpress  `js_type_of.md`

	typeof(aa) == 'function'
	typeof(bb) == 'string'
