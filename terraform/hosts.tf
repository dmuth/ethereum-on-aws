



resource "aws_instance" "ethereum1" {

	ami						= "${lookup(var.amis, "us-east-1")}"
	#instance_type			= "t2.micro"
	#instance_type			= "t2.small" # 2 GB RAM, 1 core
	#instance_type			= "t2.medium" # 4 GB RAM/ 2 cores
	instance_type			= "t2.large" # 8 GB RAM/ 2 cores
	key_name				= "${var.ec2_key}"

	vpc_security_group_ids	= ["${aws_security_group.ethereum.id}"]
	subnet_id = "subnet-f41254bc"

	root_block_device {
		volume_size		= 30
	}

	tags {
		Name		= "ethereum-1"
		terraform	= "yes"
	}

    iam_instance_profile = "${aws_iam_instance_profile.ethereum_instance_profile.id}"
	
}

output "ip" {
	value	= "${aws_instance.ethereum1.public_ip}"
}

output "hostname" {
	value	= "${aws_instance.ethereum1.public_dns}"
}

output "s3_bucket" {
	value	= "${var.s3_bucket}"
}


