
#
# What region and AWS profile are we using?
#
provider "aws" {
	region		= "us-east-1"
	profile		= "terraform-aws"
}


#####
#
# VPC
#
variable "vpc_id" {
	type		= "string"
	default		= "FIXME" # Fill this in with your own value
}


#
# EC2 
#
variable "ec2_key" {
	type		= "string"
	default		= "FIXME" # Fill this in with your own value
}


#
# Our S3 bucket for storing Ethereum data in.
#
variable "s3_bucket" {
	type	= "string"
	default	= "FIXME" # Fill this in with your own value
}

#
# Where are we logging bucket activity with Cloudtrail?
#
variable "s3_logging_bucket" {
	type	= "string"
	default	= "FIXME" # Fill this in with your own value
}

variable "s3_logging_prefix" {
	type	= "string"
	default	= "log/FIXME" # Fill this in with your own value
}

#####
#
# IAM stuff.
#
variable "iam_role" {
	type	= "string"
	default	= "ethereum_iam_role"
}

variable "instance_profile" {
	type	= "string"
	default	= "ethereum_instance_profile"
}

variable "iam_role_policy" {
	type	= "string"
	default	= "ethereum_iam_role_policy"
}

#####
#
# DNS Zone info.
#
variable "dns_zone_id" {
	type	= "string"
	default	= "FIXME" # Fill this in with your own value
}

variable "dns_hostname" {
	type	= "string"
	default	= "FIXME" # Fill this in with your own value
}


