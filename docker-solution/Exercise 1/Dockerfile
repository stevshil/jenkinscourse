FROM jenkins/jenkins:2.439-jdk21
# Install required plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jcasc.yaml /usr/share/jenkins/jenkins.yaml
ENV CASC_JENKINS_CONFIG="/usr/share/jenkins"
VOLUME /var/jenkins_home
ENTRYPOINT ["java","-Duser.home=/var/jenkins_home","-Djenkins.model.Jenkins.slaveAgentPort=50000","-Dhudson.lifecycle=hudson.lifecycle.ExitLifecycle", "-Djenkins.install.runSetupWizard=false","-jar","/usr/share/jenkins/jenkins.war"]
