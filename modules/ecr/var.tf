
variable "aws_region" {
  description = "aws region"
}
variable "aws_profile" {} 

variable "remote_state_bucket" {}

variable "env" {
  type = string
}

variable "name" {
  type = string
}

locals {
  repository_name = format("%s-%s", var.name, var.env)
}