resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.test.id
    name = "allow all rules"
    description = "allow inbound and outbound"
    ingress {
        to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow inbound rules"
    }
egress {
    to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow outbound rules"
}
tags = {
  Name = "${var.vpc_name}-sg"
}
  
}