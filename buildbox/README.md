### Packer Buildbox
> This will create an ami for our buildbox which is used to deploy software in aws

#### Packages
1. All requirements for [Amazonia](https://github.com/GeoscienceAustralia/amazonia)
1. Terraform
1. Terragrunt
1. Packer
1. Ruby (for running tests)

#### Usage
1. Download and install Packer from [packer.io](http://packer.io)
2. Run `packer build build.json` to create a new AMI
3. Deploy a new EC2 instance using the AMI that was created in step 2.
4. ssh to the public IP of your EC2 instance.

#### Contributing
* Tests are defined in the tests folder and use [serverspec](http://serverspec.org/)
* If you have added any software please ensure it is reflected in the tests