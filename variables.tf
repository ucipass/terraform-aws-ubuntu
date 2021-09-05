variable "name" {
  type = string
  description = "Unique identifier for EC2 instance and prefix for associated resources"
  default = "TEST"    
 }

variable "instance_type" {
  type = string
  default = "t2.micro"    
 }

variable "key_name" {
  type = string
}

variable "subnet_public_id" {
  type = string
  # default = "subnet-0b275d7c962ecf314"
}

variable "subnet_private_id" {
  type = string
  # default = "subnet-0f4c9e8947d92ae9a"
}

variable "security_group_public_id" {
  type = string
  # default = "sg-03501dddfd7c1ace3"
}

variable "security_group_private_id" {
  type = string
  # default = "sg-03501dddfd7c1ace3"
}

