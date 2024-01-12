# Provides a security group resource for elb
resource "aws_security_group" "webapp_sg_for_elb" {
  name   = "webapp-sg_for_elb"
  vpc_id = aws_vpc.myapp_vpc.id
  ingress {
    description      = "Allow http request from anywhere"
    protocol         = "tcp"
    from_port        = 80
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Provides a security group resource for ec2
resource "aws_security_group" "webapp_sg_for_ec2" {
  name   = "webapp-sg_for_ec2"
  vpc_id = aws_vpc.myapp_vpc.id
  ingress {
    description     = "Allow http request from Load Balancer"
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.webapp_sg_for_elb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Provides a security group resource for DB
resource "aws_security_group" "webapp_sg_for_db" {
  name   = "RDSSecurityGroup"
  vpc_id = aws_vpc.myapp_vpc.id
  tags = {
    "Name" = "RDSSecurityGroup"
  }
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webapp_sg_for_elb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}