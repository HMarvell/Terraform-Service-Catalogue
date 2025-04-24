#! bin/bash
### This is a script that will allow for package management to be pulled as a module, reducing the size of the main .sh.
### This file should be installed in the following location on the EC2 instance "/tmp/react-files"

### Package management###
sudo yum update -y
# Pull and install node version manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Load nvm
source ~/.bashrc
# Use nvm to install node18 supported on AL2
nvm install 18
# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y