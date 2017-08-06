


resource "aws_security_group" "ethereum" {

	name		= "Ethereum"
	vpc_id		= "${var.vpc_id}"

	tags {
		Name		= "SSH, ping, HTTP, TCP outbound"
		terraform	= "yes"
	}
	
	ingress {
		from_port		= -1
		to_port 		= -1
		protocol 		= "icmp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	ingress {
		from_port		= 22
		to_port 		= 22
		protocol 		= "tcp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	ingress {
		from_port		= 80
		to_port 		= 80
		protocol 		= "tcp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	#
	# This is for Ethereum TCP in
	# Source: https://ethereum.stackexchange.com/a/810
	#
	ingress {
		from_port		= 30303
		to_port 		= 30303
		protocol 		= "tcp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	#
	# Ethereum UDP in
	#
	ingress {
		from_port		= 30303
		to_port 		= 30303
		protocol 		= "udp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	#
	# Ethereum TCP out
	#
	egress {
		from_port		= 30303
		to_port 		= 30303
		protocol 		= "tcp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	#
	# Ethereum UDP out
	#
	egress {
		from_port		= 30303
		to_port 		= 30303
		protocol 		= "udp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	egress {
		from_port		= -1
		to_port 		= -1
		protocol 		= "icmp"
		cidr_blocks		= ["0.0.0.0/0"]
	}

	#
	# Allow everything outbound
	#
	egress {
		from_port	= 0
		to_port		= 65535
		protocol	="tcp"
		cidr_blocks	= ["0.0.0.0/0"]
	}

}


