resource "aws_iam_user" "s3_readonly" {
  name = "s3-readonly-user-${var.postfix}"
}

locals {
  s3_readonly_policy = {
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
  }
  s3_readwrite_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3:Describe*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*",
          "s3:Put*",
          "s3:Delete*",
          "s3:PutObject*",
          "s3:PutObjectAcl*",
          "s3:PutObjectTagging*",
          "s3:PutObjectVersionTagging*",
          "s3:PutObjectVersionAcl*",
          "s3:PutObjectVersionTagging*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  }
}

resource "aws_iam_user_policy" "s3_ro" {
  name = "s3-policy-${var.postfix}"
  user = aws_iam_user.s3_readonly.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.policy_type == "s3_readonly_policy" ? local.s3_readonly_policy : local.s3_readwrite_policy)
}

output "iam_user_name" {
  value = aws_iam_user.s3_readonly.name
}