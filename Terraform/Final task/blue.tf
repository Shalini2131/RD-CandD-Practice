resource "aws_instance" "blue" {
  # count                  = var.enable_blue_env ? var.blue_instance_count : 0
  ami                    = "ami-04db49c0fb2215364"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = "S3_bucket_access"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  user_data              = <<-EOF
    #!/bin/bash
sudo yum update -y
sudo yum install httpd -y
service httpd start
chkconfig httpd on
sudo aws s3 cp s3://demo-project-bucket/blue.html /var/www/html/index.html
chown ec2-user index.html
EOF
  tags = {
    Name = "Blue version"
  }
}
