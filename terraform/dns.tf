


resource "aws_route53_record" "eth1" {
	zone_id = "${var.dns_zone_id}"
	name    = "${var.dns_hostname}"
	type    = "A"
	ttl     = "60"
	records = ["${aws_instance.ethereum1.public_ip}"]
}

output "dns_name" {
	value = "${aws_route53_record.eth1.fqdn}"
}



