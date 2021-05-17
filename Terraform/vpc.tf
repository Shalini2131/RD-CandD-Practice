## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "terraform-demo-vpc"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}



## Create Subnets ##
resource "aws_subnet" "tf-public-subnet_1" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}
output "aws_subnet_subnet_1" {
  value = "${aws_subnet.tf-public-subnet_1.id}"
}

resource "aws_subnet" "tf-public-subnet_2" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}
output "aws_subnet_subnet_2" {
  value = "${aws_subnet.tf-public-subnet_2.id}"
}


resource "aws_subnet" "tf-private-subnet_1" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}
output "aws_subnet_subnet_3" {
  value = "${aws_subnet.tf-private-subnet_1.id}"
}

resource "aws_subnet" "tf-private-subnet_2" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}

output "aws_subnet_subnet_4" {
  value = "${aws_subnet.tf-private-subnet_2.id}"
}

#Creating Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-vpc-igw"
  }
}
