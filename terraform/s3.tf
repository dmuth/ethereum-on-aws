
#
# Create our S3 Bucket.
# This was based on the code at https://adrianhesketh.com/2016/06/27/creating-aws-instance-roles-with-terraform/
# Note that once the bucket is created, it should probably be commented out so it isn't 
# deleted when tearing down the EC2 instance.
#
resource "aws_s3_bucket" "ethereum_bucket" {

    bucket = "${var.s3_bucket}"
    acl = "private"

    versioning {
            enabled = true
    }

	logging {
		target_bucket = "${var.s3_logging_bucket}"
		target_prefix = "log/${var.s3_logging_prefix}"
	}

    tags {
        Name = "ethereum"
    }

}

