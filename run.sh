#!/bin/bash


# 修改监听端口

LISTEN=${LISTEN:-80}

echo "PI DASHBOARD LISTENING ON PORT ${LISTEN}"

sed -i -r "s/^(\s+listen.*?)80/\1${LISTEN}/g" /etc/nginx/sites-available/default
# cat /etc/nginx/sites-available/default

# 启动服务
/etc/init.d/php5-fpm start
nginx -g "daemon off;"
