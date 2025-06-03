variable "postfix" {
  type        = string
  description = "Postfix for the admin user"
}

variable "policy_type" {
  type        = string
  description = "Policy type [ s3_readonly_policy / s3_readwrite_policy ]"
}