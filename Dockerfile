FROM openshift/jenkins-slave-maven-centos7

RUN pwd
RUN curl https://github.com/oracle/graal/releases/download/vm-1.0.0-rc5/graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz
RUN ls -l
RUN tar xvf graalvm-ce-1.0.0-rc5-linux-amd64.tar.gz
RUN export GRAALVM_HOME=/path/to/graalvm

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
