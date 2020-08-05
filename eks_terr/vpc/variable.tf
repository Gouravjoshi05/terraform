variable "cidr" {
  default = "10.10.0.0/16"
}

variable "vpc_name" {
  default = "delhiveryItgc"
}

variable "project" {
  default = "delhiveryItgc"
}

variable "purpose" {
  default = "DCMTool"
}

variable "owner" {
  default = "delhivery-itgc-aws@delhivery.com"
}

variable "environment" {
  default = "Production"
}
#

variable "subnets" {
  type        = number
  default     = 3
  description = "The number of subnets required, less than or equal to the number of availability zones"
}

locals {
 public_cidrs  = ["${cidrsubnet("${var.cidr}", 8, 10)}", "${cidrsubnet("${var.cidr}", 8, 20)}", "${cidrsubnet("${var.cidr}", 8, 30)}"]
 private_cidrs = ["${cidrsubnet("${var.cidr}", 8, 40)}", "${cidrsubnet("${var.cidr}", 8, 50)}", "${cidrsubnet("${var.cidr}", 8, 60)}"]
}
