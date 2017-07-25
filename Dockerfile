FROM centos:centos7
MAINTAINER Gregory N. Mirsky <gmirsky@gmail.com>

# get updates via yum
RUN yum update -y && yum clean all

RUN cd /opt && \
    curl -j -k -L -H "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz | tar xz

RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_141/bin/java 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_141/bin/javac 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_141/bin/jar 2

ENV JAVA_HOME /opt/jdk1.8.0_141
ENV JRE_HOME=/opt/jdk1.8.0_141/jre
ENV PATH=$PATH:/opt/jdk1.8.0_141/bin:/opt/jdk1.8.0_141/jre/bin

ENV HOME /root

WORKDIR /root

CMD ["/bin/bash"]

