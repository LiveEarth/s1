# Provides an Auto Scaling Group resource.
resource "aws_autoscaling_group" "webapp_autoscaling-group" {
  desired_capacity = 2
  max_size         = 2
  min_size         = 2
# Connect to the target group
  target_group_arns = [aws_lb_target_group.webapp_applb_targetgr.arn]
# Creating EC2 instances in private subnet
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id]
  launch_template {
    id      = aws_launch_template.webapp_ec2_template.id
    version = "$Latest"
  }
}
