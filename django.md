# django 基础知识

## 创建 python 虚拟环境目录 
```
$ cd djangogirls  
$ python -m venv  myvenv
# 上面会创建一个 myvenv 目录，下面是启动虚拟环境
$ myvenv/Scripts\activate 
# 启动后控制台变成 myvenv 前缀。 好像是就当前命令窗口管用  
```

## 安装 django 
`pip install django` 

也可以写到 版本文件中再安装  文件内容 `Django==1.11`
` pip install -r .\django1\requirement.txt`

## 第一个 django 网站 
1 创建 django 模板
`django-admin startproject mysite .`  
2 修改设置 TIME_ZONE  LANGUAGE_CODE  STATIC_URL STATIC_ROOT ALLOWED_HOSTS    
3 初始化数据库  `python manage.py migrate`  
4 启动 `python manage.py runserver` 默认端口是8000   

5 再加一个 django app `python manage.py startapp blog`  
    然后 settings.py  INSTALLED_APPS 添加一行  `'blog.apps.BlogConfig'`
6 其它 blog 后续操作看原文去。  [Django Models][1]   
    python manage.py makemigrations blog
    python manage.py migrate blog

创建超级用户
`python manage.py createsuperuser`  按提示填用户名，邮箱，密码  
收集静态文件
`python manage.py collectstatic`
## app 相关命令
新建一个 app `python manage.py startapp appname`

数据库模型修改和合并
python manage.py makemigrations appname
python manage.py migrate appname


# 可以部署到免费的 PythonAnyWhere

## 打开虚拟环境
$ workon  qinglangee.pythonanywhere.com 

## 更新 static 文件

[1]: https://tutorial.djangogirls.org/en/django_models/