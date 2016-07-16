provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"
  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(split(",", var.vpc_private_subnets), count.index)}"
  availability_zone = "${element(split(",", var.vpc_azs), count.index)}"
  count = "${length(compact(split(",", var.vpc_private_subnets)))}"
  tags {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(split(",", var.vpc_public_subnets), count.index)}"
  availability_zone = "${element(split(",", var.vpc_azs), count.index)}"
  count = "${length(compact(split(",", var.vpc_public_subnets)))}"
  tags {
    Name = "${var.vpc_name}-public"
  }
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "${var.vpc_name}-public"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.main.id}"
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
  count = "${length(split(",", var.vpc_private_subnets))}"
  tags {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

resource "aws_route_table_association" "public" {
  count = "${length(compact(split(",", var.vpc_public_subnets)))}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count = "${length(compact(split(",", var.vpc_private_subnets)))}"
  subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
