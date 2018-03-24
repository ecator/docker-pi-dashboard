# 容器化环境自动构建
FROM resin/rpi-raspbian
LABEL version="0.1"
LABEL description="Pi Dashboard for Docker"
MAINTAINER ecat <qule520@126.com>

# 环境变量配置
ENV www_root /var/www
ENV www_name pi-dashboard
ENV git_repo "https://github.com/spoonysonny/pi-dashboard.git"

ENV nginx_default /etc/nginx/sites-available/default

# 安装依赖
RUN apt update \
	&& apt install -y git nginx php5-fpm php5-cli php5-curl php5-gd php5-mcrypt php5-cgi \
	&& rm -rf /var/lib/apt/lists/*

# 下载dashboard
RUN cd ${www_root} \
	&& git clone $git_repo $www_name --depth 1

# 复制nginx配置
COPY $nginx_default $nginx_default

# 卸载中间工具

RUN apt remove -y git

# 复制启动脚本
COPY /run.sh /run.sh
RUN chmod 777 /run.sh
CMD /run.sh