# Elastic IP for NAT gateway
resource "aws_eip" "webapp_elastic-ip" {
  depends_on = [aws_internet_gateway.webapp_internet-gw]
  vpc        = true
  tags = {
    Name = "EIP_for_NAT"
  }
}

# NAT gateway for private subnets - to access internet resources
resource "aws_nat_gateway" "webapp_nat_private-subnet" {
  allocation_id = aws_eip.webapp_elastic-ip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "NAT for private subnet"
  }

  depends_on = [aws_internet_gateway.webapp_internet-gw]
}

# Create route table connecting to NAT
resource "aws_route_table" "webapp_private_route-table" {
  vpc_id = aws_vpc.myapp_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.webapp_nat_private-subnet.id
  }
}

# Associate the route table with private subnet
resource "aws_route_table_association" "webapp_private_rta" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.webapp_private_route-table.id
}