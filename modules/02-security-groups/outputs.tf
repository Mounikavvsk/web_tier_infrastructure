output "alb_security_group_id" {
  value = aws_security_group.web_tier_alb_sg.id
}

output "web_security_group_id" {
  value = aws_security_group.web_tier_web_sg.id
}
