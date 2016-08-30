FROM centos:6.8
MAINTAINER Animesh Sikder
RUN yum install openssh-server openssh-client telnet httpd man -y
RUN /etc/init.d/sshd start;/etc/init.d/httpd start;mkdir /root/dockerscripts
COPY postscript.sh /tmp/
RUN chmod 777 /tmp/postscript.sh
RUN echo "root:123456" | chpasswd
EXPOSE 80 22
ENTRYPOINT ["sh","/tmp/postscript.sh"]
