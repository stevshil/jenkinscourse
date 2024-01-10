#!/bin/bash

/usr/bin/java -jar /home/jenkins/agent.jar \
-jnlpUrl http://192.168.10.230:8080/computer/Linux1/jenkins-agent.jnlp \
-secret 66e1865386684416c6815cf1ad163fcf2e5e926db5e655933690aeeedcd27165 \
-workDir "/home/jenkins"
