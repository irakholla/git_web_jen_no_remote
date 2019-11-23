FROM centos:7
WORKDIR /devops
COPY jen/web.sh /devops/web.sh
RUN yum update -y
RUN yum install python3 -y
RUN yum install git -y
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install docker-ce -y
RUN git init
RUN git pull https://github.com/irakholla/git_web_jen_no_remote.git
RUN ["chmod", "+x", "/devops/web.sh"]
EXPOSE 5000:5000
ENTRYPOINT ["/devops/web.sh"]
