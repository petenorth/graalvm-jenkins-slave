FROM openshift/jenkins-slave-maven-centos7

USER root

ENV GRAALVM_BASE /opt/graalvm
ENV GRAALVM_HOME $GRAALVM_BASE/graalvm-ce-1.0.0-rc5

RUN mkdir $GRAALVM_BASE
RUN curl -o $GRAALVM_BASE/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz  -L  https://github.com/oracle/graal/releases/download/vm-1.0.0-rc5/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz 
RUN cd $GRAALVM_BASE && tar xvf $GRAALVM_BASE/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz --directory $GRAALVM_BASE

RUN ls -l $GRAALVM_HOME
RUN echo $GRAALVM_HOME

RUN chown -R 1001:0 $GRAALVM_HOME && \
    chmod -R g+rw $GRAALVM_HOME

USER 1001
