FROM centos
MAINTAINER lishujun lishujun@sirbox.cn

# install jdk8 
ADD jdk-8u201-linux-x64.rpm /tmp
ADD profile /tmp

RUN rpm -ivh /tmp/jdk-8u201-linux-x64.rpm
RUN cat /tmp/profile >> /etc/profile

# install nginx
ADD nginx-release-centos-7-0.el7.ngx.noarch.rpm /tmp
RUN rpm -Uvh /tmp/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install -y nginx
RUN systemctl enable nginx.service
EXPOSE 80

# install mysql
ADD mysql-community-release-el7-5.noarch.rpm /tmp
RUN rpm -ivh /tmp/mysql-community-release-el7-5.noarch.rpm
RUN yum install -y mysql-server mysql-client mysql-devel
#RUN systemctl enable mysqld.service
EXPOSE 3306

# set system startup program
ENTRYPOINT ["/usr/sbin/init"]
