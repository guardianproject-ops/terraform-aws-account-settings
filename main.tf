resource "aws_iam_account_alias" "default" {
  account_alias = module.this.id
}

resource "aws_iam_account_password_policy" "default" {
  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  max_password_age               = var.max_password_age
  minimum_password_length        = var.minimum_password_length
  password_reuse_prevention      = var.password_reuse_prevention
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_uppercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
}

locals {
  account_alias = aws_iam_account_alias.default.account_alias
}

resource "aws_s3_account_public_access_block" "block_public_s3" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "cloudtrail" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=tags/0.14.0"

  enabled                       = var.cloudtrail_enabled
  context                       = module.this.context
  attributes                    = concat(module.this.attributes, ["cloudtrail"])
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  s3_bucket_name                = var.cloudtrail_bucket_name
}
