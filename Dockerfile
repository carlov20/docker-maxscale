FROM centos:7

MAINTAINER cv

RUN rpm -i http://downloads.mariadb.com/enterprise/d8nz-arh0/generate/10.0/mariadb-enterprise-repository.rpm
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y maxscale
ADD maxscale.cnf /etc/
ADD start.sh /
RUN sed -i -e 's/\r$//' /start.sh
EXPOSE 3306
CMD ["/start.sh"]