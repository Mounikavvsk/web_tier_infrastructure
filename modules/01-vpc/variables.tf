#
# VPC vars
#

variable "region" {
  default = "ap-southeast-2"
}

variable "max_availability_zones" {
  default = "2"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "az_a" {
  default = "ap-southeast-2a"
}

variable "az_b" {
  default = "ap-southeast-2b"
}

variable "public_subnet_a_cidr" {
  default = "10.1.0.0/24"
}

variable "public_subnet_b_cidr" {
  default = "10.1.1.0/24"
}
