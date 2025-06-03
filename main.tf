resource "aws_iam_user" "s3_readonly" {
  name = "s3-readonly-user-${var.postfix}"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.s3_readonly.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3:Describe*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

output "iam_user_name" {
  value = aws_iam_user.s3_readonly.name
}