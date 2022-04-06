说明文档
=======

## Docker环境搭建  
对于 Ubuntu 18 以上系统，可执行 setup_on_ubuntu.sh 脚本搭建环境
* Docker v20.10.x
* docker-compose v1.28.x
* Mysql v5.6+ 使用 docker-compose 创建

## 配置主从数据库
* Step1: 创建和运行两个数据库，在 mysql 目录执行 docker-compose up，待容器跑起来后，确认 root 账号能登录
```bash
mysql -h 127.0.0.1 -P 3306 -u root -p'123'
```
* Step2: 分别登录两个数据库，配置账号和主从同步，可参考 my_setup.sh 文件的SQL脚本。(待优化为 Docker 自动执行)

* Step3: 在主数据库创建或修改表数据，确认马上有同步到从数据库

## 测试主从同步性能
* 可参考项目 [agilejzl/master-slave-db-demo](https://github.com/agilejzl/master-slave-db-demo)
