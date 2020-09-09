variable "password_policy_enabled" {
  description = "Whether or not to create the IAM account password policy"
  default     = true
  type        = bool
}

variable "allow_users_to_change_password" {
  description = "Whether to allow users to change their own password"
  default     = true
  type        = bool
}

variable "hard_expiry" {
  description = "Whether users are prevented from setting a new password after their password has expired (i.e. require administrator reset)"
  default     = false
  type        = bool
}

variable "max_password_age" {
  description = "The number of days that a user's password is valid"
  default     = 0
  type        = number
}

variable "minimum_password_length" {
  description = "Minimum length to require for user passwords"
  default     = 8
  type        = number
}

variable "password_reuse_prevention" {
  description = "The number of previous passwords that users are prevented from reusing"
  default     = 5
  type        = number
}

variable "require_lowercase_characters" {
  description = "Whether to require lowercase characters for user passwords"
  default     = true
  type        = bool
}

variable "require_uppercase_characters" {
  description = "Whether to require uppercase characters for user passwords"
  default     = true
  type        = bool
}

variable "require_numbers" {
  description = "Whether to require numbers for user passwords"
  default     = true
  type        = bool
}

variable "require_symbols" {
  description = "Whether to require symbols for user passwords"
  default     = true
  type        = bool
}

variable "cloudtrail_bucket_name" {
  description = "S3 bucket name for cloudtrail logs"
  type        = string
}

variable "cloudtrail_enabled" {
  type        = bool
  description = "Specifies whether to create the mutlri-region cloudtrail"
  default     = true
}

variable "log_expiration_days" {
  description = "Number of days after which to expunge the objects from the log bucket"
  type        = number
  default     = 90
}
