#zblogphp-docker
---
基于Z-BlogPHP在线安装程序构建，自动下载最新版本的Z-BlogPHP。

## 部署方式
### 灵雀云

1. [打开镜像社区，搜索zblogphp](https://hub.alauda.cn/repos/search/?match_string=zsxsoft%2Fzblogphp)。
2. 点击创建服务。
3. 其它随意填写，建议选择有状态服务，挂载/app和/etc/mysql，让你的数据可备份。
![Alauda](images/image-alauda.png)

### 非云服务
首先，需要[安装Docker](http://yeasy.gitbooks.io/docker_practice/content/install/index.html)。
其次，
```bash
sudo docker pull index.alauda.cn/zsxsoft/zblogphp
sudo docker run --name zbphp -v /app -t -p 80:80 -p 3306:3306 zblogcn/zblogphp 
```

## 程序安装说明
1. Docker启动后，直接打开http://localhost/。
2. 数据库主机``localhost``，用户名``root``，密码空，数据库名``zbphp``，其他任意。如图：
![Install](images/image-install.png)
3. 安装完成，尽情享受吧！
![Finished](images/image-admin.png)
