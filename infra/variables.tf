variable "region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Name for the EC2 key pair"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_type_master" {
  default = "t2.small"
}