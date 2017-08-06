
#
# Create an IAM role to apply to EC2 servers, and a policy that allows 
# access to the S3 bucket.
# This was based on examples from https://adrianhesketh.com/2016/06/27/creating-aws-instance-roles-with-terraform/
#

#
# Create an IAM role which can be applied to EC2 servers.
#
resource "aws_iam_role" "ethereum_iam_role" {
    name = "${var.iam_role}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "ethereum_instance_profile" {
	name = "ethereum_instance_profile"
	role = "ethereum_iam_role"
}


resource "aws_iam_role_policy" "ethereum_iam_role_policy" {

  name = "${var.iam_role_policy}"
  role = "${aws_iam_role.ethereum_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.s3_bucket}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${var.s3_bucket}/*"]
    }
  ]
}
EOF
}




