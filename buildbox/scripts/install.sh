#!/bin/bash

sudo apt-get update
sudo apt-get install -y --force-yes python3-pip wget curl git patch gcc pylint unzip docker.io
sudo pip3 install awscli troposphere boto3 hiera-py nose coverage iptools requests bumpversion inflection pyyaml cerberus gitpython jinja2

# Terraform
wget https://releases.hashicorp.com/terraform/0.8.5/terraform_0.8.5_linux_amd64.zip
unzip terraform_0.8.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
# Terragrunt
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.9.6/terragrunt_linux_amd64
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt
# Packer
wget https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip
unzip packer_0.12.1_linux_amd64.zip
sudo mv packer /usr/local/bin/packer

