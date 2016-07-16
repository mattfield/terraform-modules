output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnets" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnets" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "nat_eips" {
  value = "${join(",", aws_eip.nat.*.public_ip)}"
}
