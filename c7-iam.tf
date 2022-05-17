resource "aws_iam_role" "test_role" {
  name = "test_role"

 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:*",
      "Principal": {
        "Service": 
                   "ec2:*"                 
 },
      "Resource": "arn:aws:iam::792820380616:role/test_role",
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
tags = {
      tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = "${aws_iam_role.test_role.id}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
          "iam:*",
          "iam:CreateUser",
          "iam:CreateRole",
          "iam:*AccessKey*",
       "iam:DeleteRole",
      "iam:DeleteRolePolicy",
       "iam:GetRole",
       "iam:PassRole",
       "iam:PutRolePolicy",
]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}

