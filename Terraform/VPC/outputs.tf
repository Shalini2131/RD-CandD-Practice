output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}

output "aws_subnet_subnet_1" {
  value = "${aws_subnet.tf-public-subnet_1.id}"
}

output "aws_subnet_subnet_2" {
  value = "${aws_subnet.tf-public-subnet_2.id}"
}

output "aws_subnet_subnet_3" {
  value = "${aws_subnet.tf-private-subnet_1.id}"
}

output "aws_subnet_subnet_4" {
  value = "${aws_subnet.tf-private-subnet_2.id}"
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_ssh_sg.id}"
}

