
# Jenkins on AWS EC2

This folder contains a terraform template that creates an AWS EC2 instance with Jenkins running on port 8080. The cost should be $0.00 if your account is in the AWS free tier.

## Pre-requisites
1. Terraform 0.13 in your local machine.
2. SSH keys in your local machine.
3. AWS access key and security key.

## Running terraform
1. Create a file named _terraform.tfvars_.
2. Then, copy the following lines to the file and replace the empty strings:
```sh
# AWS Settings
aws_access_key = ""
aws_secret_key = ""
aws_region     = ""
aws_ssh_key    = ""
```
Example tfvars content:

```sh
# AWS Settings
aws_access_key = "123abcdefg4567"
aws_secret_key = "765qwerty0912a"
aws_region     = "ap-southeast-1"
aws_ssh_key    = "ssh 8a1j-)21+akz test@local.com"
```
3. Run `terraform init` to initialize AWS provider plugin.
4. Run `terraform plan` to review the changes to be done on your AWS platform.
5. Run `terraform apply` and answer __yes__ to set off the changes to AWS.

## Configuring Jenkins
If the previous steps are successful, there should be a _jenkins\_url_ displayed. In case you want to setup the Jenkins instance, do the following:

1.  Run the following command to get the initial admin password. Remember to replace <JENKINS_URL>.
```sh
ssh ec2-user@<JENKINS_URL>  'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'
```
2. Open _<JENKINS_URL>:8080_ in your favorite browser then put the initial admin password.
3. Select "Install suggested plugins", wait for the installation to be completed.
4. Setup your admin account.
5. On Instance Configuration for JENKINS_URL,  select "Save and Finish".
6. Then select "Start using Jenkins".


Todo:
- [ ] Use data block to get AMI id instead of hardcoding it
