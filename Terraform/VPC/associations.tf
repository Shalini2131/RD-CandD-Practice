#creating public route table for igw
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

#creating private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terraform-vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
}

#route table association for public subnet 1
resource "aws_route_table_association" "rta_subnet_public1" {
  subnet_id      = aws_subnet.tf-public-subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}
#route table association for public subnet 2
resource "aws_route_table_association" "rta_subnet_public2" {
  subnet_id      = aws_subnet.tf-public-subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}
#route table association for private subnet 1
resource "aws_route_table_association" "rta_subnet_private1" {
  subnet_id      = aws_subnet.tf-private-subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

#route table association for private subnet 2
resource "aws_route_table_association" "rta_subnet_private2" {
  subnet_id      = aws_subnet.tf-private-subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
