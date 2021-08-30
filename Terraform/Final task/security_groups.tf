resource "aws_security_group" "ssh-sg" {
  description = "Allowing SSH from anywhere"
  name        = "final-task-ssh-sg"
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "final-task-ssh-sg"
  }
}

resource "aws_security_group" "http-sg" {
  description = "Allowing HTTP from anywhere"
  name        = "final-task-http-sg"
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "final-task-http-sg"
  }
}

