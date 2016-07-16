variable "region" {
  default = "eu-west-1"
}

variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "vpc_private_subnets" {
  description = "Comma-delimited list of CIDR ranges for private subnets"
  default = ""
}
variable "vpc_public_subnets" {
  description = "Comma-delimited list of CIDR ranges for public subnets"
  default = ""
}

variable "vpc_azs" {}
variable "vpc_nat_gateways_count" {
  description = "Number of desired NAT gateways. Defaults to 0."
  default = 0
}
