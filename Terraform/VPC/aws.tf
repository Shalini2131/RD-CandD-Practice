provider "aws" {
  region = "us-east-1"
}


# public instance-1 
resource "aws_instance" "tf_public_instance_1" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_ssh_sg.id}" ]
    subnet_id = "${aws_subnet.tf-public-subnet_1.id}"
    key_name               = "terraform-demo"
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_1"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}
# public instance 2
resource "aws_instance" "tf_public_instance_2" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_ssh_sg.id}" ]
    subnet_id = "${aws_subnet.tf-public-subnet_2.id}"
    key_name               = "terraform-demo"
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_2"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}
# private instance 1
resource "aws_instance" "tf_private_instance_1" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_ssh_sg.id}" ]
    subnet_id = "${aws_subnet.tf-private-subnet_1.id}"
    key_name               = "terraform-demo"
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_3"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}

