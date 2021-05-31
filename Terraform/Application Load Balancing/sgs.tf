## Security Groups##
resource "aws_security_group" "terraform_ssh_sg" {
  description = "Allowing SSH from anywhere"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = "terraform_ec2_ssh_sg"
  
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Name = "ec2-SSH-sg"
  }
}

resource "aws_security_group" "terraform_http_sg" {
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = "terraform_http_sg"
  description = "Allowing HTTP from anywhere"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "ec2-http-sg"
    Description = "Allowing HTTP from anywhere"
  }
}
