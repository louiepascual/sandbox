# Jenkins on AWS EC2
> :warning: This small project is ongoing, please see Todo below for the remaining tasks.

This folder contains a terraform template that creates an AWS EC2 instance with Jenkins running on port 8080. The cost should be $0.00 if your account is in the free tier.

## Pre-requisites
1. Terraform 0.13 in your local machine
2. SSH keys in your local machine
3. AWS access key and security key

## Run the setup
1. Create a file named _terraform.tfvars_
2. Then, copy the following lines to the file and replace the empty strings:
```bash
# AWS Settings
aws_access_key = ""
aws_secret_key = ""
aws_region     = ""
aws_ssh_key    = ""
```
3. Run `terraform init` to initialize AWS provider plugin
4. Run `terraform plan` to review the changes to be done on your AWS platform
5. Run `terraform apply` and answer __yes__ to set off the changes to AWS

## Example tfvars content
```bash
# AWS Settings
aws_access_key = "123abcdefg4567"
aws_secret_key = "765qwerty0912a"
aws_region     = "ap-southeast-1"
aws_ssh_key    = "ssh 8a1j-)21+akz test@local.com"
```

Todo:
- [ ] Use data block to get AMI id instead of hardcoding it
- [ ] Add user_data to aws_instance block to setup Jenkins
- [ ] Add documentation on how to initially configure Jenkins