# 问题
## 编译报错
 2. LINK : fatal error LNK1123: failure during conversion to COFF: file invalid or corrupt

解决方法:

项目-->工程属性->配置属性-> 清单工具->输入和输出->嵌入清单，选择[否]   ----------->只要设这个就可以了

项目-->项目属性-->配置属性-->清单工具-->使用FAT32解决方法为 是;
