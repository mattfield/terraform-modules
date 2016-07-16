Terraform VPC module
--------------------

Terraform module that creates a new VPC in AWS, including:

* Private and public subnets
* One public route table, and one route table for each private subnet
* Internet gateway

Input variables
===============

* `region` - AWS region for the VPC (default: eu-west-1)
* `vpc_name` - VPC name
* `vpc_cidr_block` - CIDR block for VPC
* `vpc_public_subnets` - Comma-separated list of public subnet CIDRs
* `vpc_private_subnes` - Comma-separated list of private subnet CIDRs
* `vpc_azs` - Comma-separated list of AZs in which to distrbute subnets

Usage
=====

```
module "vpc" {
  source = "github.com/mattfield/terraform-modules/vpc"

  vpc_name = "main"

  vpc_cidr_block = "10.8.0.0/16"
  vpc_public_subnets = "10.8.1.0/24,10.8.2.0/24"
  vpc_private_subnets = "10.8.3.0/24,10.8.4.0/24"

  vpc_azs = "eu-west-1a,eu-west-1b,eu-west-1c"
}
```

Outputs
=======

* `vpc_id` - VPC ID
* `public_subnet_ids` - Comma-separated list of public subnet IDs
* `private_subnet_ids` - Comma-separated list of private subnet IDs
* `public_route_table_ids` - Comma-separated list of public route table IDs
* `private_route_table_ids` - Comma-separated list of private route table IDs
