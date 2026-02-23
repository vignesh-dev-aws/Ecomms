#!/bin/bash

echo "Updating system..."
sudo yum update -y

echo "Installing Java (OpenJDK 17)..."
sudo yum install java-17-amazon-corretto -y

echo "Installing Git..."
sudo yum install git -y

echo "Installing Docker..."
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

echo "Installing Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install jenkins -y

sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Installation Complete!"

echo "Java Version:"
java -version

echo "Git Version:"
git --version

echo "Docker Version:"
docker --version

echo "Jenkins Status:"
sudo systemctl status jenkins
