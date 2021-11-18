resource "aws_default_route_table" "week11-pub-rt" {
  default_route_table_id = aws_vpc.main-week11.default_route_table_id
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      instance_id = ""
      ipv6_cidr_block = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    }
  ]
  tags = {
    Name = "week11-pub-rt"
  }
}



resource "aws_route_table" "week11-pri-rt" {
  vpc_id = aws_vpc.main-week11.id

  route = [
   
  ]

  tags = {
    Name = "week11-pri-rt"
  }
}





#private subnets association  are below

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.week11-pri-a.id
  route_table_id = aws_route_table.week11-pri-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.week11-pri-b.id
  route_table_id = aws_route_table.week11-pri-rt.id
}

