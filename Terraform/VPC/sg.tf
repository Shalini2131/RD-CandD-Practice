## Security Group##
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

  

  tags = {
    Name = "ec2-SSH-sg"
  }
}

