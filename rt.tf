resource "aws_route_table" "test-rt" {
  vpc_id = aws_vpc.test.id
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
  Name ="${var.vpc_name}-rt"
}
}

resource "aws_route_table_association" "subnets" {
    count = 4
    route_table_id = aws_route_table.test-rt.id
    subnet_id = element(aws_subnet.subnets[*].id,count.index+1)  
}