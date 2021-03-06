FROM openshift/jenkins-slave-maven-centos7

USER root

ENV GRAALVM_BASE /opt/graalvm
ENV GRAALVM_HOME $GRAALVM_BASE/graalvm-ce-1.0.0-rc5
ENV JAVA_HOME $GRAALVM_HOME
ENV PATH $JAVA_HOME/bin:$PATH

RUN mkdir $GRAALVM_BASE && curl -o $GRAALVM_BASE/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz  -L  https://github.com/oracle/graal/releases/download/vm-1.0.0-rc5/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz && cd $GRAALVM_BASE && tar xvf $GRAALVM_BASE/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz --directory $GRAALVM_BASE

RUN yum -y groupinstall "Development Tools" && yum -y install zlib1g-dev zlib-devel glibc glibc-static libstdc++-static && yum clean all -y

RUN which javac

RUN chown -R 1001:0 $GRAALVM_HOME && \
    chmod -R g+rw $GRAALVM_HOME

USER 1001
