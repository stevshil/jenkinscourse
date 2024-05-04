#!/bin/bash

if [[ ! -d /home/student/jenkins ]]
then
    mkdir /home/student/jenkins
    chmod 777 /home/student/jenkins
fi

docker run -itd --name=jenkins --restart=always -p 8080:8080 -p 50000:50000 \
-v /home/student/plugins.txt:/usr/share/jenkins/ref/plugins.txt:ro \
-v /home/student/jcasc.yaml:/usr/share/jenkins/jenkins.yaml:ro \
-v /home/student/jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker --user=root \
-e CASC_JENKINS_CONFIG="/usr/share/jenkins" \
jenkins/jenkins:2.439-jdk21 bash -c \
"mkdir /var/jenkins_home/plugins && jenkins-plugin-cli --verbose \
--war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt \
--plugin-download-directory /var/jenkins_home/plugins; \
java -Duser.home=/var/jenkins_home -Djenkins.model.Jenkins.slaveAgentPort=50000 \
-Dhudson.lifecycle=hudson.lifecycle.ExitLifecycle \
-Djenkins.install.runSetupWizard=false -jar /usr/share/jenkins/jenkins.war"
