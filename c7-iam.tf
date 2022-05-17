resource "aws_iam_role" "sample_1" {
  name = "test_role"

assume_role_policy = <<EOF
    {

  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:sts::792820380616:role/sample_1",
          "arn:aws:iam::792820380616:user/Spoorthy,
          "arn:aws:iam::792820380616:root"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
  
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

