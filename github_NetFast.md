💻 方法一：修改Hosts文件（最直接，新手首选）

这是技术社区里最常用、也最直接的解决方案

。它的原理是绕过不稳定的DNS解析，在你的电脑里直接写入GitHub的正确IP地址“通讯录”。

操作步骤如下：

    获取最新的GitHub IP地址
    由于IP地址可能会变动，为了获得最佳效果，建议先查询当前最有效的IP。打开终端，使用 nslookup 命令查询github.com和github.global.ssl.fastly.net两个域名

：
bash

nslookup github.com
nslookup github.global.ssl.fastly.net

记录下查询结果中Address后面的IP地址（通常是响应最快的那个）。

编辑Hosts文件
使用sudo权限和文本编辑器（如nano, vim, gedit）打开/etc/hosts文件：
bash

sudo nano /etc/hosts

添加映射记录
在文件末尾，按照IP地址 域名的格式添加以下两行（请使用你刚刚查到的IP地址）：
bash

# GitHub Hosts Start
140.82.114.4    github.com
199.232.69.194  github.global.ssl.fastly.net
# GitHub Hosts End

如果你希望一次性解决更多GitHub相关域名的访问问题，也可以直接使用网络上持续维护的Hosts方案（例如GitHub上的521xueweihan/GitHub520项目），将完整内容复制并粘贴到你的/etc/hosts文件中

    。

保存并刷新DNS缓存

    保存文件并退出编辑器（nano编辑器按Ctrl+O保存，Ctrl+X退出）。

    刷新DNS缓存使修改生效。不同Ubuntu版本的命令略有不同，可以依次尝试：

sudo systemctl restart nscd

