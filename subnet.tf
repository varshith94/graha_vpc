resource "aws_subnet" "subnets" {
  vpc_id = aws_vpc.test.id
  count = 4
  cidr_block = element(var.public_cidr_block,count.index)
  map_public_ip_on_launch = true
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "${var.vpc_name}public-${count.index+1}"
  }
}