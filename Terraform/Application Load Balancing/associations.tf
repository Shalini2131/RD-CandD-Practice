#creating public route table for igw
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
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
