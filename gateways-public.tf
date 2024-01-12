# Configure Internet Gateway
resource "aws_internet_gateway" "webapp_internet-gw" {
  vpc_id = aws_vpc.myapp_vpc.id
}

# Add route table for public subnet - connecting to Internet gateway
resource "aws_route_table" "webapp_public_route-table" {
  vpc_id = aws_vpc.myapp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webapp_internet-gw.id
  }
}

# Associate the route table with public subnet 1
resource "aws_route_table_association" "webapp_public_rta_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.webapp_public_route-table.id
}

# Associate the route table with public subnet 2
resource "aws_route_table_association" "webapp_public_rta_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.webapp_public_route-table.id
}