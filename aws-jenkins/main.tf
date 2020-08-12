provider "aws" {
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

data "aws_vpc" "default_vpc" {
    default = true
}

resource "aws_security_group" "jenkins_sg" {
    name        = "jenkins_sg"
    description = "Allow SSH and HTTP access to the Jenkins EC2 instance"
    vpc_id      = data.aws_vpc.default_vpc.id

    ingress {
        protocol     = "TCP"
        from_port    = 22
        to_port      = 22
        cidr_blocks  = var.aws_jenkins_allowed_ips
        description  = "Allow SSH"
    }

    ingress {
        protocol     = "TCP"
        from_port    = 80
        to_port      = 80
        cidr_blocks  = var.aws_jenkins_allowed_ips
        description  = "Allow HTTP"
    }

    ingress {
        protocol     = "TCP"
        from_port    = 8080
        to_port      = 8080
        cidr_blocks  = var.aws_jenkins_allowed_ips
        description  = "Allow default Jenkins port"
    }

    egress {
        protocol     = -1
        from_port    = 0
        to_port      = 0
        cidr_blocks  = ["0.0.0.0/0"]
        description  = "Allow all outbound IPv4 traffic"
    }
}

resource "aws_key_pair" "jenkins_admin" {
    key_name   = "jenkins_admin"
    public_key = var.aws_ssh_key
}

resource "aws_instance" "jenkins_vm" {
    ami                          = "ami-02de387a2c625404f"
    instance_type                = "t2.micro"
    key_name                     = aws_key_pair.jenkins_admin.key_name
    associate_public_ip_address  = true
    security_groups              = [aws_security_group.jenkins_sg.name]
    user_data                    = file("init.sh")
}

output "jenkins_url" {
    value = aws_instance.jenkins_vm.public_dns
}