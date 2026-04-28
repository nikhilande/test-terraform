variable "name" {}

variable "vpc_id" {}

variable "subnets" {
  type = list(string)
}

variable "desired_count" {
  type = number
}

variable "target_group_arn" {
  type = string
}
variable "alb_sg_id" {
  type = string
}