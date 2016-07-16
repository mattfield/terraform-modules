Terraform NAT gateway module
----------------------------

Terraform module that creates VPC NAT gateways. This module will always deploy
a gateway setup in HA i.e. one gateway in each public subnet, mapping to one
private subnet.

Input variables
===============

* `region` - AWS region for the VPC (default: eu-west-1)
* `nat_public_subnet_ids` - Comma-separated list of public subnet IDs (must be at least two)
* `nat_private_subnet_ids` - Comma-separated list of private subnet IDs (must be at least two)
* `nat_private_route_table_ids` - Comma-separated list of private route table IDs (to match private subnets)

Usage
=====

```
module "nat" {
  source = "github.com/mattfield/terraform-modules/nat"

  nat_public_subnet_ids = "subnet-6ae06f0e,subnet-899a55d1"
  nat_private_subnet_ids = "subnet-889a55d0,subnet-6be06f0f"
  nat_private_route_table_ids = "rtb-77fc9813,rtb-70fc9814"
}
```

Outputs
=======

* `nat_eips` - Comma-separated list of NAT gateway Elastic IPs
