variable "environment" {
  type    = string
  default = "stage"
}
variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "remote_state_bucket" {
  type = string
}

variable "remote_state_region" {
  type = string
}
