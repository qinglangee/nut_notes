# obs 录屏直播软件

## mac 录不了声音
要装一个什么小软件
## linux 录不了声音
[Ubuntu通过pulseaudio配置多声道][1]  
`sudo apt-get install pulseaudio` 安装pulseaudio  
`sudo apt-get install pavucontrol` 安装pulseaudio的控制GUI  
打开GUI，在output devices标签能看到现有的devices的显示名称  
`pactl list short sinks` 在命令行显示devices的内部名称，后面会用到(内部名字类似　alsa_output.pci-0000_00_1f.3.analog-stereo)  
`pactl load-module module-null-sink` 新建一个空的声道，建好后在output devices标签能看到  
    此命令输出一个数字(如：24)，代表这个空声道，后面会用到
    发声的软件输出到这个声道obs才可以录到，但耳机音箱就没声音了，下面新建一个组合声道
`pactl load-module module-combine-sink slaves=<number>,<name>` 利用前面的数字和内部名字，新建组合声道  
示例：`pactl load-module module-combine-sink slaves=24,alsa_output.pci-0000_00_1f.3.analog-stereo`  
*要是创建失败的话就试两个都用名字*  
自定义名称   `pactl load-module module-combine-sink sink_name=<custom name> slaves=<number>,<name>`  

在GUI的play back标签中，把发声软件的输出指向组合声道，obs中录制时选择null声道就可以了．

麦克风的声音在input devices中打开就可以录制了，如果不想在耳机中听到麦克的输出，就在GUI的play back标签中把麦克风的输出声音关掉









[1]: https://obsproject.com/forum/threads/include-exclude-audio-sources-using-pulseaudio-linux.18525/