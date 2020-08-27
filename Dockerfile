FROM ubuntu:20.04

# Install required dependencies for jenkins slave launch
RUN apt-get update && apt-get install -y openssh-server openjdk-8-jre-headless apt-transport-https ca-certificates software-properties-common git make curl

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce

RUN mkdir -p /root/.ssh
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
ENV SSH_PASSWORD jenkins
ENV SSH_KEY ""

RUN mkdir /var/run/sshd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]
