# cl 编译器命令行用法

## 使用
需要先安装 visual studio, 用 visual studio 带的一些命令行工具，会定向好相关工具的链接。  

cl -D_WIN32_WINNT=0x0A00 /EHsc /I d:\software\boost\boost_1_74_0\ lab5.cpp    /link  /LIBPATH:D:\software\boost\boost_1_74_0\stage\lib

## 参数
/I  指定include 目录
/link  小写，向链接器传递参数
/LIBPATH 链接目录


WIN32_WINNT  指定系统平台
//
// _WIN32_WINNT version constants
//
#define _WIN32_WINNT_NT4                    0x0400 // Windows NT 4.0
#define _WIN32_WINNT_WIN2K                  0x0500 // Windows 2000
#define _WIN32_WINNT_WINXP                  0x0501 // Windows XP
#define _WIN32_WINNT_WS03                   0x0502 // Windows Server 2003
#define _WIN32_WINNT_WIN6                   0x0600 // Windows Vista
#define _WIN32_WINNT_VISTA                  0x0600 // Windows Vista
#define _WIN32_WINNT_WS08                   0x0600 // Windows Server 2008
#define _WIN32_WINNT_LONGHORN               0x0600 // Windows Vista
#define _WIN32_WINNT_WIN7                   0x0601 // Windows 7
#define _WIN32_WINNT_WIN8                   0x0602 // Windows 8
#define _WIN32_WINNT_WINBLUE                0x0603 // Windows 8.1
#define _WIN32_WINNT_WINTHRESHOLD           0x0A00 // Windows 10
#define _WIN32_WINNT_WIN10                  0x0A00 // Windows 10