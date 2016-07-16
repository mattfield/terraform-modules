variable "region" {
  default = "eu-west-1"
}

variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "vpc_private_subnets" {
  description = "Comma-delimited list of CIDR ranges for private subnets"
}
variable "vpc_public_subnets" {
  description = "Comma-delimited list of CIDR ranges for public subnets"
}

variable "vpc_azs" {}
