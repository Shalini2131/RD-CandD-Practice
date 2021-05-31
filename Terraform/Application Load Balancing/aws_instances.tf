provider "aws" {
  region = "us-east-1"
}

# public instance 
resource "aws_instance" "alb-instance" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_ssh_sg.id}","${aws_security_group.terraform_http_sg.id}" ]
    subnet_id = "${aws_subnet.tf-public-subnet_1.id}"
    key_name               = "demo-key-pair"
    associate_public_ip_address = true
    user_data              = <<-EOF
			#!/bin/bash 
            yum update –y 
            amazon-linux-extras install nginx1.12
            systemctl start nginx
            systemctl enable nginx
            cd /usr/share/nginx/html
            mkdir red
            mkdir yellow
            mkdir blue
            echo "<html><head><title>ALB</title></head><body style='background-color:red;'><h1>Hello World!!</h1></body></html>" > /usr/share/nginx/html/red/index.html
            echo "<html><head><title>ALB</title></head><body style='background-color:blue;'><h1>Hello World!!</h1></body></html>" > /usr/share/nginx/html/blue/index.html
            echo "<html><head><title>ALB</title></head><body style='background-color:yellow;'><h1>Hello World!!</h1></body></html>" > /usr/share/nginx/html/yellow/index.html
		    EOF
    tags = {
      Name              = "terraform_ec2_1"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}