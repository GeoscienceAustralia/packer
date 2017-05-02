# Packer Simple Webserver
> This will create an ami with tomcat8 installed

## Packages
1. Tomcat8
1. Ruby (for running tests)
1. ufw (firewall)
1. fail2ban (blocks IPs committing suspicious activity)
1. Deafault-jdk (for tomcat / unpacking jars)

## Usage
1. Download and install Packer from [packer.io](http://packer.io)
4. `packer build build.json`
3. Deploy a new EC2 instance using the AMI that was created in step 2.
4. Head to the public DNS record for the new instance to see your 'Hello, world!'

## Advanced usage
1. add home ips to fail2ban whitelist:
2. `export HOME_IP_HTML=yourip`
3. `packer build build.json`

1. add html and ssh ips to fail2ban whitelist
2. `export HOME_IP_HTML=yourip`
2. `export HOME_IP_SSH=yoursship`
3. `packer build build.json`

## Customisations from default tomcat

### Network
* Configure a software firewall
* Secure shared memory
* IP Spoofing protection
* Ignore ICMP broadcast requests
* Disable source packet routing
* Ignore send redirects
* Block SYN Attacks
* Log Martians
* Ignore ICMP Redirects
* Ignore Directed pings

### Tomcat
* Hide server signatures and headers

### Fail2Ban
* Set Ignore IPs to GA
* Monitor sshd logs for attacks, ban IPs for 10 minutes

## Contributing
* Tests are defined in the tests folder and use [serverspec](http://serverspec.org/)
* If you have added any software please ensure it is reflected in the tests

## ROADMAP
### Improve Security logging
* Install PSAD
* Install RKHunter and CHKRootKit
* Install NMAP
* Setup LogWatch
* Setup Tiger and Tripwire
* Run all of these tools nightly
* Install logstash / fluentd
* send logs to monitoring server by default
* Add prometheus support