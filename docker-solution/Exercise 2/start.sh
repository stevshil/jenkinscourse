#!/bin/bash
if [[ ! -d /var/jenkins_home/plugins ]]
then
    # We can do this at start up as the volume will be mapped before this happens
    mv /var/tmp/plugins /var/jenkins_home/plugins
fi
java -Duser.home=/var/jenkins_home -Djenkins.model.Jenkins.slaveAgentPort=50000 \
-Dhudson.lifecycle=hudson.lifecycle.ExitLifecycle -Djenkins.install.runSetupWizard=false \
-jar /usr/share/jenkins/jenkins.war
