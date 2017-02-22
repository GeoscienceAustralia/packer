# Packer Codedeploy Server
> This will create an ami for use with an AWS codedeploy app

#### Packages
1. Codedeploy-agent
1. Ruby (for running tests)

#### Usage
1. Download and install Packer from [packer.io](http://packer.io)
2. Run `packer build build.json` to create a new AMI
3. Deploy a new EC2 instance using the AMI that was created in step 2.
4. ssh to the public IP of your EC2 instance.

#### Contributing
* Tests are defined in the tests folder and use [serverspec](http://serverspec.org/)
* If you have added any software please ensure it is reflected in the tests