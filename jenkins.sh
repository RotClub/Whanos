#! /bin/bash

# Set the Jenkins home directory
export JENKINS_HOME=$PWD/jenkins
export JENKINS_PORT=8080
export JENKINS_LOGS=$JENKINS_HOME/logs

# Run Jenkins
if sudo docker-compose up; then
    echo "Jenkins is running on http://localhost:$JENKINS_PORT"
else
    echo "Jenkins failed to start"
fi
