#!/bin/bash
sudo yum update -y
sudo yum install -y java-1.8.0-openjdk.x86_64
sudo yum remove -y java-1.7.0-openjdk.x86_64
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install -y jenkins
sudo service jenkins start