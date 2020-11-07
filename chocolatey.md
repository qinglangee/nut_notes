# chocolatey 使用

## 安装
requirements : win7+  powershell v2+  .NET Framework 4+

用管理员打开 PowerShell, 

检查安全策略:
    you must ensure Get-ExecutionPolicy is not Restricted.We suggest using Bypass to bypass the policy to get things installed or AllSigned for quite a bit more security.
    用下面的方法放松策略:
    Run `Get-ExecutionPolicy`. If it returns `Restricted`, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

然后运行 `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

没报错的话就算安装完成了

## 使用 
用来安装 hyper  `choco install hyper`