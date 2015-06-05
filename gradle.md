  vim: ft=markdown
#  gradle 记事本

## 设置编码

     //设置编码  
    tasks.withType(Compile) {  
        options.encoding = "UTF-8"  
    }  

## 显示 dependency

    gradle dependencies
For more information check the section [11.6.4 Listing project dependencies ][1] 










[1]: http://www.gradle.org/docs/current/userguide/userguide_single.html#sec:listing_dependencies
