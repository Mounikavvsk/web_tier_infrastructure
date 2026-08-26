
# load-balancer security group

resource "aws_security_group" "web_tier_alb_sg" {
  name        = "web-tier-alb-sg"
  description = "Allow inbound HTTP traffic to the load balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP from the internet to the web tier load balancer"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "web_tier_alb_sg"
  }
}


# web instance security group

resource "aws_security_group" "web_tier_web_sg" {
  name        = "web-tier-web-sg"
  description = "Allow inbound HTTP traffic only from the load balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_tier_alb_sg.id]
    description     = "HTTP from the web tier load balancer"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "web_tier_web_sg"
  }
}