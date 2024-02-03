variable "create" {
  type        = bool
  default     = true
  description = "Whether to create user pool or not"
}

variable "user_pool_name" {
  type        = string
  default     = "default-name"
  description = "User pool name"
}

variable "user_groups" {
  type        = map(any)
  description = "Cognito groups configuration"
  default     = {}
}

variable "deletion_protection" {
  type        = string
  default     = "ACTIVE"
  description = "Deletion protecion, possible values ACTIVE and INACTIVE"
}
variable "mfa_configuration" {
  type        = string
  default     = "OFF"
  description = "MFA configuration"
}

variable "auto_verified_attributes" {
  type        = list(any)
  default     = ["email"]
  description = "Auto-verified list of attributes"
}

variable "username_attributes" {
  type        = list(any)
  default     = ["email"]
  description = "Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes"
}

variable "recovery_mechanism" {
  type        = any
  default     = []
  description = "List of user recovery mechanisms"
}

variable "allow_admin_create_user_only" {
  type        = bool
  default     = false
  description = "Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app"
}

# variable "invite_message_template" {
#   type = any
#   default = null
#   description = "Invite message template structure."
# }

variable "email_configuration" {
  type = map(any)
  default = {
    configuration_set      = null
    email_sending_account  = "COGNITO_DEFAULT"
    from_email_address     = null
    reply_to_email_address = null
    source_arn             = null
  }
  description = "Email configuration set name from SES"
}

variable "password_policy" {
  type = any
  default = {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  description = "Password policy"
}

variable "schema" {
  type        = list(any)
  default     = []
  description = "Schema configuration"
}

variable "user_attributes_require_verification_before_update" {
  type        = list(any)
  default     = ["email"]
  description = "A list of attributes requiring verification before update. If set, the provided value(s) must also be set in auto_verified_attributes. Valid values: email, phone_number"
}

variable "username_case_sensitive" {
  type        = bool
  default     = false
  description = "Whether username case sensitivity will be applied for all users in the user pool through Cognito APIs"
}


variable "verification_message_template" {
  type = any
  default = {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = null
    email_message_by_link = null
    email_subject         = null
    email_subject_by_link = null
    sms_message           = null
  }

  description = "Template for notifications"
}

variable "invite_message_template" {
  type = any
  default = {
    email_message = null
    email_subject = null
    sms_message   = null
  }

  description = "Invite message template structure"
}

variable "create_clients" {
  type        = bool
  default     = true
  description = "Create clients or not"
}

variable "user_pool_client" {
  type        = any
  default     = {}
  description = "Configuration block for client"
}

variable "identity_providers" {
  type        = any
  default     = {}
  description = "Map with IDP configuration"
}

variable "token_validity_units" {
  type        = any
  default     = {}
  description = "Map with IDP configuration"
}

variable "route53_zone_name" {
  type        = string
  default     = ""
  description = "Zone 53 zone name"
}

variable "create_identity_providers" {
  type        = bool
  default     = true
  description = "Whether to create IDP or not"
}

variable "resource_servers" {
  type        = any
  default     = {}
  description = "Map with resource servers configuration"
}

variable "create_resource_servers" {
  type        = bool
  default     = false
  description = "Whether to create resource servers or not"
}

variable "tags" {
  description = "Default tags"
  type        = map(any)
  default     = {}
}
