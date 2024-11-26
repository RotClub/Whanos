FROM jenkins/jenkins:lts

USER jenkins

WORKDIR /var/jenkins_home

COPY --chown=jenkins plugins.txt /usr/share/jenkins/ref/

RUN jenkins-plugin-cli --plugins -f /usr/share/jenkins/ref/plugins.txt

COPY --chown=jenkins config.yml .

# COPY --chown=jenkins job_dsl.groovy .
