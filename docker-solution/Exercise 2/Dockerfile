FROM jenkins/jenkins:2.439-jdk21
USER root
RUN echo "docker:x:109:jenkins" >>/etc/group
ADD https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.15/jenkins-plugin-manager-2.12.15.jar /usr/local/bin/jenkins-plugin-manager.jar
RUN chmod 755 /usr/local/bin/jenkins-plugin-manager.jar
# Install required plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jcasc.yaml /usr/share/jenkins/jenkins.yaml
COPY start.sh /start-jenkins.sh
RUN chmod 755 /start-jenkins.sh
RUN jenkins-plugin-cli --verbose --war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt \
    --plugin-download-directory /var/tmp/plugins
ENTRYPOINT ["/start-jenkins.sh"]
