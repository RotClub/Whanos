#! /bin/bash

# Set the Jenkins home directory
export JENKINS_HOME=$PWD/jenkins_home
export JENKINS_PORT=8080

# Setup the admin password
echo "Enter the admin password: "
read PWD
export ADMIN_PASSWORD=$PWD

# Run Jenkins
sudo docker build -t kloups/whanos-jenkins:latest -f jenkins/Dockerfile jenkins/
sudo docker run -d \
    -p $JENKINS_PORT:8080 \
    -p 50000:50000 \
    --env ADMIN_PASSWORD="${ADMIN_PASSWORD}" \
    --name whanos-jenkins \
    kloups/whanos-jenkins:latest

# Print the Jenkins URL
echo "Jenkins is now running at http://localhost:$JENKINS_PORT"
echo "  - Jenkins home directory mounted at $JENKINS_HOME"
echo "  - To access the Jenkins logs, run: sudo docker logs whanos-jenkins"
echo "  - To stop Jenkins, run: sudo docker stop whanos-jenkins"
echo "  - To remove Jenkins, run: sudo docker rm whanos-jenkins"
echo "  - To restart Jenkins without deleting it, run: sudo docker start whanos-jenkins"

# Remove the admin password variable from the env
unset ADMIN_PASSWORD
