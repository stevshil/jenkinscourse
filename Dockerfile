FROM jenkins/jenkins:2.426.2-jdk11
USER root
RUN echo "docker:x:109:jenkins" >>/etc/group
ADD https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.15/jenkins-plugin-manager-2.12.15.jar /usr/local/bin/jenkins-plugin-manager.jar
RUN chmod 755 /usr/local/bin/jenkins-plugin-manager.jar
# Install required plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jcasc.yaml /usr/share/jenkins/jenkins.yaml
COPY start.sh /start-jenkins.sh
RUN chmod 755 /start-jenkins.sh
RUN ls -l /usr/local/bin /usr/share/jenkins/ref /usr/share/jenkins
# RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# RUN java -jar /usr/local/bin/jenkins-plugin-manager.jar --verbose --war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt --plugin-download-directory /var/tmp/plugins
RUN jenkins-plugin-cli --verbose --war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt --plugin-download-directory /var/tmp/plugins
# USER jenkins
#ENTRYPOINT ["java","-Duser.home=/var/jenkins_home","-Djenkins.model.Jenkins.slaveAgentPort=50000","-Dhudson.lifecycle=hudson.lifecycle.ExitLifecycle", "-Djenkins.install.runSetupWizard=false","-jar","/usr/share/jenkins/jenkins.war"]
ENTRYPOINT ["/start-jenkins.sh"]