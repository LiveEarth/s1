# Provides an EC2 launch template resource. Can be used to create instances or auto scaling groups
resource "aws_launch_template" "webapp_ec2_template" {
  name_prefix   = "webapp-ec2-template"
  image_id      = "ami-03a6eaae9938c858c"
  instance_type = var.instance_type
  user_data     = filebase64("user_data.sh")
  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.private_subnet_1.id
    security_groups             = [aws_security_group.webapp_sg_for_ec2.id]
  }
# Define name for the EC2 instances
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "webapp-instance"
    }
  }
}
