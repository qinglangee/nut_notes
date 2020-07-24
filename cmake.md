# cmake basic 用法

基本操作见 cmake_demo01.md  cmake_demo02.md

## 添加引用动态链接和静态链接库

动态库的添加： (有点没太搞得明白)
```
link_directories(${PROJECT_SOURCE_DIR}/lib) #添加动态连接库的路径
target_link_libraries(project_name -lmxnet ) #添加libmxnet.so
```
静态库的添加：
```
add_library(mxnet STATIC IMPORTED)
set_property(TARGET mxnet PROPERTY IMPORTED_LOCATION /path/to/libmxnet.a)  # ${PROJECT_BINARY_DIR}  ${PROJECT_SOURCE_DIR}
target_link_libraries(project_name mxnet ) #添加libmxnet.a
```