  vim: ft=markdown

# 命令
## 新版命令
`magick aa.png bb.jpg`

## 旧的命令
查看支持的图片类型

    identify -list format
图片合成 [ImageMagicK之合成图片][1]  
1. 使用convert命令加 +append或-append参数
2. 使用convert命令加 -composite参数
3. 直接使用composite命令来完成

示例

    convert +append u0.png u1.png u.png
    convert +append d0.png d1.png d.png
    convert -append u.png d.png dest.png
- 说明：其中 +append 横向把多张图片拼接在一起，可以多于2张，图片按上边缘对齐,最后一个参数是目标图片,而-append是纵向拼接图片,图片按左边缘对齐

图片缩放

 等比例缩放

    convert -resize 200×100 src.jpg dest.jpg  # 会压缩到不超过标示数值, 但是等比例压缩

    convert -resize 200 src.jpg dest.jpg
    得到图片宽为200，高根据原始图片比例计算而来

    convert -resize x100 src.jpg dest.jpg
    得到的图片高位100，宽根据原始图片比例计算而来

其它缩放方式, 见引用 之 blog 


    




refs:  

[ImageMagicK之合成图片][1]  
[ImageMagick之图片缩放][2]  


[1]: http://www.netingcn.com/imagemagick-composite.html  
[2]: http://www.netingcn.com/imagemagick-resize.html
