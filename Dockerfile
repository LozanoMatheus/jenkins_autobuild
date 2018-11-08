FROM openjdk:8-jre-alpine

LABEL Author="Matheus Lozano" \
      Github="github.com/lozanomatheus/jenkins_autobuild" \
      Dockerhub="cloud.docker.com/repository/docker/lozanomatheus/jenkins"

RUN set -ex \
  && apk add --no-cache --virtual .fetch-deps \
    curl \
  && addgroup -g 1000 jenkins \
  && adduser -h /opt/jenkins -s /sbin/nologin -G jenkins -D -u 1000 jenkins \
  && curl -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war -o /opt/jenkins/jenkins.war \
  && LATEST_VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/hashicorp/terraform/releases/latest | sed 's/.*tag\/v//') \
  && curl -s -o- https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_linux_amd64.zip | unzip -q -d /usr/bin/ - \
  && chmod 0555 /usr/bin/terraform \
  && curl -L https://media.githubusercontent.com/media/LozanoMatheus/jenkins_autobuild/master/jenkins.tar.gz | tar -xz -C /opt/jenkins \
  && chown -R jenkins. /opt/jenkins

USER jenkins
EXPOSE 8080:8080/tcp 50000:50000/tcp

ENV projectName=lozanomatheus/aws-sdk-test

ENTRYPOINT ["/opt/jenkins/startup.sh"]
