  vim: ft=markdown
# 命令
* cc -g test.c -o test     #编译时要用-g参数把调试信息加到可执行文件中:
* gdb test  # 开始调试
* l # 查看代码
* break 16  #在第16行设置断点
* break func  # 设置断点,在函数func()入口处
* info break  # 查看断点信息
* r      # 运行程序,run命令简写
* n      # 单条语句执行, next简写
*        # 直接回车,执行上一条命令
* c      # continue 继续运行程序
* p i    # print 打印变量i的值
* bt     # 查看函数堆栈
* finish # 退出函数
* q      # quit 退出gdb
