# Configure webapp LB
resource "aws_lb" "webapp_lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webapp_sg_for_elb.id]
  subnets            = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_1b.id]
  depends_on         = [aws_internet_gateway.webapp_internet-gw]
}

# Provides a Target Group resource for use with Load Balancer resources
resource "aws_lb_target_group" "webapp_applb_targetgr" {
  name     = "webapp-applb-targetgr"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myapp_vpc.id
}

# Provides a Load Balancer Listener resource
resource "aws_lb_listener" "webapp_lb_listener" {
  load_balancer_arn = aws_lb.webapp_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_applb_targetgr.arn
  }
}