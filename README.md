# php_docker
docker php enviroment

# 目录结构
## /apps           ->   网站目录
## /php            ->   PHP配置信息目录
## /nginx          ->   Nginx配置信息目录
## /mysql          ->   Mysql配置信息目录
## /redis          ->   Redis配置信息目录
## /data           ->   数据落地目录
## /data/mysql     ->   Mysql数据
## /data/redis     ->   Redis数据
## /runtime        ->   运行日志目录

# php-fpm
version         ->   7.3.5
version         ->   7.4

# redis
version         ->   latest

# mysql
version         ->   5.7

# nginx
version         ->   latest



# 脚本
./start.sh  PHP版本号    => 启动
./stop.sh  PHP版本号    => 关闭
./down.sh  PHP版本号    => 关闭并删除
注：PHP版本号仅支持7.35 | 7.4，默认为7.4