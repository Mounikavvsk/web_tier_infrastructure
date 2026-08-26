#
# auto scaling group
#

resource "aws_autoscaling_group" "web_tier_asg" {
  name                      = "web-tier-asg"
  vpc_zone_identifier       = var.public_subnet_ids
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_type         = "ELB"
  health_check_grace_period = 60
  target_group_arns         = [var.target_group_arn]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web_tier_instance"
    propagate_at_launch = true
  }
}
