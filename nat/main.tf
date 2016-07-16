provider "aws" {
  region = "${var.region}"
}

resource "aws_eip" "nat" {
  vpc = true
  count = "${length(split(",", var.nat_gateway_count))}"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id = "${element(split(",", var.nat_public_subnet_ids), count.index)}"
  count = "${var.nat_gateway_count}"
}

resource "aws_route" "nat_gateway" {
  route_table_id = "${element(split(",", var.nat_private_route_table_ids), count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index)}"
  count = "${var.nat_gateway_count}"
}
