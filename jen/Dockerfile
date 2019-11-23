FROM centos:7
WORKDIR /devops
COPY jen/nginx.conf /devops/nginx.conf
COPY jen/my_password.txt /devops/my_password.txt
COPY jen/nginx.repo  /devops/nginx.repo
COPY jen/pipeline.sh /devops/pipeline.sh
COPY jen/ps.sh /devops/ps.sh
COPY jen/web.sh /devops/web.sh
RUN yum update -y
RUN yum install python3 -y
RUN yum install git -y
RUN git init
RUN git pull https://github.com/irakholla/project.git
RUN cat nginx.repo > /etc/yum.repos.d/nginx.repo
RUN yum install nginx -y
RUN cat nginx.conf > /etc/nginx/nginx.conf
RUN ["chmod", "+x", "/devops/web.sh"]
EXPOSE 5000:5001
ENTRYPOINT ["/devops/web.sh"]
