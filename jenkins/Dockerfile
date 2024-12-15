FROM jenkins/jenkins:lts
USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV JENKINS_HOME="/var/jenkins_home"
ENV CASC_JENKINS_CONFIG="/var/jenkins_home/casc_configs"

COPY config.yml /var/jenkins_home/casc_configs/casc.yml
COPY job_dsl.groovy /var/jenkins_home/
COPY plugins.txt /var/jenkins_home/

RUN jenkins-plugin-cli --plugins -f /var/jenkins_home/plugins.txt