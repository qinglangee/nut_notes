# electron 基础内容

html 技术开发跨平台桌面应用

## 初始应用 
1. npm init 初始化一个 package.json . 
2. 修改默认 start 命令，用 electron 启动脚本
```
{
  "name": "your-app",
  "version": "0.1.0",
  "main": "main.js",
  "scripts": {
    "start": "electron ."
  }
}
```
3. "main" 中指定的启动js文件写点窗口初始化内容
```

```

4. npm start 启动看看界面。 

## 快捷键
C-S-i 打开控制台等工具

## 概念 


## 渲染进程
主进程可以使用BrowserWindow创建多个渲染器进程。每个BrowserWindow都是一个单独的、惟一的渲染器器进程，包括一个DOM，访问Chromium web APIs，以及Node内置模块。访问BrowserWindow模块的方式与访问app模块的方式相同

页面引用外部文件 
```
<script>require('./renderer');</script>
```

## 进程通信
Electron提供了许多方便进程间通信的方法。第一个是`remote`模块－一种从渲染器进程到主进程执行进程间通信的简单方法。  
webContents有一个名为send()的方法，它将信息从主进程发送到渲染器进程。  

ipcRender可以向主进程发送消息，最重要的是，它还可以监听使用webContents.send()从主进程发送的消息。  
```
ipcRenderer.on('file-opened', (event, file, content) => {
  markdownView.value = content;
  renderMarkdownToHtml(content);
});
```