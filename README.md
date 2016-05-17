# 版本变动

版本 V1.0

支持OpenWRT


# 功能描述

本脚本用于在OpenWRT上自动化部署 **Nginx  +  Mysql  + PHP** 环境。脚本运行后，Nginx服务将开启在8080端口（为了避开OpenWRT本身的界面）。并自动生成一个名称为**index.php**的phpinfo文件.数据库将生成一个用户名为**root**密码为**admin**的用户。将新建一个www用户组用户名为www，新建**/web**目录为**Web**服务目录，数据库默认安装在**/mnt**目录中。相关配置内容路径不变，可以自行查看。

# 使用方法

将所有文件下载并上传至OpenWRT的/tmp目录。使用如下命令：
```
chmod +x OpenWRT_LNMP_install.sh
./OpenWRT_LNMP_install.sh
```

# 环境测试

完成安装后打开路由器默认地址`http://*.*.*.*:8080`,安装若成功则出现**phpinfo**信息界面.


