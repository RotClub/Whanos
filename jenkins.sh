#! /bin/bash

# Set the Jenkins home directory
export JENKINS_HOME=$PWD/jenkins_home
export JENKINS_PORT=8080

# Run Jenkins
sudo docker run \
    -p $JENKINS_PORT:8080 \
    -p 50000:50000 \
    -v $JENKINS_HOME:/var/jenkins_home \
    --env JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
    --env CASC_JENKINS_CONFIG=/var/jenkins_home/config.yml \
    --workdir /var/jenkins_home \
    --name whanos-jenkins \
    jenkins/jenkins:lts jenkins-plugin-cli --plugins -f /var/jenkins_home/plugins.txt

# Print the Jenkins URL
echo "Jenkins is now running at http://localhost:$JENKINS_PORT"
echo "  - Jenkins home directory mounted at $JENKINS_HOME"
echo "  - To access the Jenkins logs, run: sudo docker logs whanos-jenkins"
echo "  - To stop Jenkins, run: sudo docker stop whanos-jenkins"
echo "  - To remove Jenkins, run: sudo docker rm whanos-jenkins"
echo "  - To restart Jenkins without deleting it, run: sudo docker start whanos-jenkins"
