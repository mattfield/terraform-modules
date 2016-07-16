output "nat_eips" {
  value = "${join(",", aws_eip.nat.*.public_ip)}"
}
