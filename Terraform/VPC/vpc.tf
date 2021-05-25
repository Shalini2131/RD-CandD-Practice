## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "terraform-demo-vpc"
  }
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


resource "aws_subnet" "tf-public-subnet_2" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}



resource "aws_subnet" "tf-private-subnet_1" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}


resource "aws_subnet" "tf-private-subnet_2" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}

#Creating Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-vpc-igw"
  }
}

# Creating Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}
# NAT
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = aws_subnet.tf-public-subnet_1.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name        = "nat"
  }
}
