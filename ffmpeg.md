# ffmpeg windows 命令行用法
还有不会的内容可以去faq里面查。  

## 查看视频信息
`ffmpeg -i input.mp4`


## 图片与视频转换
```
# 将名为*.mp4的视频文件抽成一张张的图片（抽帧）
ffmpeg -i "*.mp4" -r 1 -q:v 2 -f image2 %d.jpeg

-i 输入的文件
-r 每秒提取图片的帧数，设置为视频的帧率，-r 1的意思就是设置为每秒获取一帧； 
-q:v 2 这个据说是提高抽取到的图片的质量的，具体的也没懂； 
-f 据说是强迫采用格式fmt 

# 把*.jpeg的一堆图片合成为视频
ffmpeg -f image2 -i %04d.jpg   out.mp4

ffmpeg -f image2 -i %04d.jpg   out.mp4  -y  # -y 表示对所有交互都回答yes, 有时候多次执行需要覆盖前面的文件。
%04d  表示 0001 0002 这样的数字，  如果是 img1  img2  就用 img%d。
ffmpeg -f image2 -start_number 100 -i %04d.jpg   out.mp4  -y # 开始序号为100

```
## 视频格式转换
input.rmvb 转换为 mp4 格式, 这个要处理编码，转换起来好慢的。   
`ffmpeg -i input.rmvb -y -qscale 0 -vcodec libx264 output.mp4`

windows bat 脚本，把文件拖到脚本上进行转换，任意格式转为 mp4  
```
@echo off
title 正在转换,mp4转换完成自动关闭
ffmpeg -i %1 -y -qscale 0 -vcodec libx264 %~n1.mp4

ping -n 5 127.0.0.1 >nul
```

有些编码一样的视频可以使用快速转换方法，比如 flv 和 mp4 可以直接用原来的编码
`ffmpeg -i input.flv  -codec copy output.mp4`

## 截取一段视频
`ffmpeg  -i ./plutopr.mp4 -vcodec copy -acodec copy -ss 00:00:10 -to 00:00:15 ./cutout1.mp4 -y`

 
-ss time_off        set the start time offset 设置从视频的哪个时间点开始截取，上文从视频的第10s开始截取
-to 截到视频的哪个时间点结束。上文到视频的第15s结束。截出的视频共5s.
如果用-t 表示截取多长的时间如 上文-to 换位-t则是截取从视频的第10s开始，截取15s时长的视频。即截出来的视频共15s.
 
注意的地方是：
 如果将-ss放在-i ./plutopr.mp4后面则-to的作用就没了，跟-t一样的效果了，变成了截取多长视频。一定要注意-ss的位置。
 
参数解析
-vcodec copy表示使用跟原视频一样的视频编解码器。
-acodec copy表示使用跟原视频一样的音频编解码器。
 
-i 表示源视频文件
-y 表示如果输出文件已存在则覆盖






refs:  
[ffmpeg转码视频真的好用！（ffmpeg的简单使用方法）](https://www.jianshu.com/p/4f399b9dfb43)   
[ffmpeg faq](http://ffmpeg.org/faq.html)   
[使用ffmpeg将任意格式视频转MP4格式](https://www.cnblogs.com/passedbylove/p/7800453.html)  



[视频文件的容器格式和编码格式](https://www.jianshu.com/p/f2f82a97adb2)  