FROM centos:7

# Update & Setting Locale
RUN yum -y update
RUN yum reinstall -y glibc-common && yum clean all
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

# Install Node.js
WORKDIR /myapp
RUN curl -sL https://rpm.nodesource.com/setup_13.x | bash
RUN yum -y install nodejs

# Setting FrameWork
RUN npm init -y
RUN npm install express --save
RUN npm install ejs --save
RUN npm install body-parser --save

COPY ./index.js /myapp
COPY ./templates/ /myapp/templates/
CMD ["/sbin/init"]
