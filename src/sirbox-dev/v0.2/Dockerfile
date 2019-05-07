FROM sirbox/dev:0.1
MAINTAINER lishujun lishujun@sirbox.cn

# set root password
RUN echo "root:sirbox.cn" | chpasswd

# install ssh
RUN yum install -y openssl openssh-server
RUN yum install -y openssh*
RUN systemctl enable sshd.service
EXPOSE 22

# set rc.local
RUN chmod +x /etc/rc.d/rc.local

# mysql innodb aio
#RUN yum install -y libaio
ADD my.cnf /etc

# set system startup program
ENTRYPOINT ["/usr/sbin/init"]
