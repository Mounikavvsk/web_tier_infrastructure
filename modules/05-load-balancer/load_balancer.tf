#
# application load balancer
#

resource "aws_lb" "web_tier_alb" {
  name               = "web-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "web_tier_alb"
  }
}

#
# listener, forwards incoming traffic to the target group
#

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_tier_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
