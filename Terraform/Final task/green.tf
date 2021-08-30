resource "aws_instance" "green" {
  count                  = var.enable_green_env ? var.green_instance_count : 0
  ami                    = "ami-04db49c0fb2215364"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[1]
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  vpc_security_group_ids = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  key_name               = "S3_bucket_access"
  user_data              = <<-EOF
    #!/bin/bash
sudo yum update -y
sudo yum install httpd -y
service httpd start
chkconfig httpd on
sudo aws s3 cp s3://demo-project-bucket/green.html /var/www/html/index.html
chown ec2-user index.html
EOF
  tags = {
    Name = "Green version"
  }
}
