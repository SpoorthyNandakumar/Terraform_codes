resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
       "sid" = ""
   "effect" = "Allow"
      "Action": [
        "iam:CreateRole",
        "iam:AttachRolePolicy",
        "iam:PassRole",
        "ec2:*",
        "sts:AssumeRole"
        ],
      "Principal": {
        type        = "Service"
        identifiers = ["ec2.amazonaws.com"]
      },
     
      "Resource":"*"

    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}



resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}



resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = "${aws_iam_role.test_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*",
        "ec2:*",
        "iam:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


