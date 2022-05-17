
  
resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = "${aws_iam_role.sample_1.id}"

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
  role = "${aws_iam_role.sample_1.name}"
}

