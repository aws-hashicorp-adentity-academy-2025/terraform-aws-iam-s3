resource "aws_iam_user" "s3_readonly" {
  name = "s3-readonly-user"
}

resource "aws_iam_user_policy_attachment" "s3_readonly_attach" {
  user       = aws_iam_user.s3_readonly.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

output "iam_user_name" {
  value = aws_iam_user.s3_readonly.name
}
