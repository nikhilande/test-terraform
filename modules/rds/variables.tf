variable "create" {
  type = bool
}

variable "instance_class" {
  type = string
}

variable "vpc_id" {
  type = string
}
variable "db_username" {
  sensitive = true
}
variable "db_password" {
  sensitive = true
}
