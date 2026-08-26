#
# AMI lookup
#

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

#
# launch template
#

resource "aws_launch_template" "web_tier_lt" {
  name_prefix   = "web-tier-lt-"
  image_id      = data.aws_ami.al2023.id
  instance_type = var.instance_type
  user_data     = base64encode(file("${path.module}/userdata.sh"))

  vpc_security_group_ids = [var.web_security_group_id]

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web_tier_instance"
    }
  }

  tags = {
    Name = "web_tier_lt"
  }
}
