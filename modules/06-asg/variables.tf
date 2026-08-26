#
# ASG vars
#

variable "launch_template_id" {}

variable "target_group_arn" {}

variable "public_subnet_ids" {}

variable "min_size" {
  default = 2
}

variable "max_size" {
  default = 2
}

variable "desired_capacity" {
  default = 2
}
