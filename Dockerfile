FROM centos:centos6

RUN yum -y update
RUN yum -y install httpd && yum clean all

RUN echo "Hello World!!" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]