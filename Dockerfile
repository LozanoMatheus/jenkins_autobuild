FROM store/oracle/serverjre:8

LABEL Author="Matheus Lozano" \
      Github="github.com/lozanomatheus/jenkins_autobuild" \
      Dockerhub="cloud.docker.com/repository/docker/lozanomatheus/jenkins"
    
RUN groupadd --gid 1000 jenkins \
    && useradd --uid 1000 --gid jenkins --groups jenkins --create-home --home-dir /opt/jenkins --shell /bin/bash jenkins \
    && yum -y update \
    && yum clean all || rm -rf /var/cache/yum

ADD jenkins.tar.gz /opt/jenkins

RUN curl -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war -o /opt/jenkins/jenkins.war \
    && LATEST_VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/hashicorp/terraform/releases/latest | sed 's/.*tag\///') \
    && curl -L https://github.com/hashicorp/terraform/archive/${LATEST_VERSION}.tar.gz -o /tmp/terraform.tar.gz \
    && tar xf /tmp/terraform.tar.gz -C /bin \
    && chown -R jenkins. /opt/jenkins

USER jenkins
EXPOSE 8080:8080/tcp 50000:50000/tcp

ENV projectName=lozanomatheus/aws-sdk-test

ENTRYPOINT ["/opt/jenkins/startup.sh"]
