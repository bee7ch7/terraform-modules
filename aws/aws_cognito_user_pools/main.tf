resource "aws_cognito_user_pool" "this" {
  count = var.create ? 1 : 0

  name                     = var.user_pool_name
  auto_verified_attributes = var.auto_verified_attributes
  deletion_protection      = var.deletion_protection
  mfa_configuration        = var.mfa_configuration

  username_attributes = var.username_attributes

  account_recovery_setting {
    dynamic "recovery_mechanism" {
      for_each = var.recovery_mechanism
      content {
        priority = recovery_mechanism.value.priority
        name     = recovery_mechanism.value.name
      }
    }
  }


  admin_create_user_config {
    allow_admin_create_user_only = try(var.allow_admin_create_user_only, false)

    dynamic "invite_message_template" {
      for_each = length(var.invite_message_template) > 0 ? [var.invite_message_template] : []
      content {
        email_message = try(invite_message_template.value.email_message, null)
        email_subject = try(invite_message_template.value.email_subject, null)
        sms_message   = try(invite_message_template.value.sms_message, null)
      }
    }
  }

  dynamic "email_configuration" {
    for_each = [var.email_configuration]
    content {
      configuration_set      = try(email_configuration.value.configuration_set, null)
      email_sending_account  = try(email_configuration.value.email_sending_account, "COGNITO_DEFAULT")
      from_email_address     = try(email_configuration.value.from_email_address, null)
      reply_to_email_address = try(email_configuration.value.reply_to_email_address, null)
      source_arn             = try(email_configuration.value.source_arn, null)
    }
  }

  dynamic "password_policy" {
    for_each = [var.password_policy]
    content {
      minimum_length                   = try(password_policy.value.minimum_length, 8)
      require_lowercase                = try(password_policy.value.require_lowercase, true)
      require_numbers                  = try(password_policy.value.require_numbers, true)
      require_symbols                  = try(password_policy.value.require_symbols, true)
      require_uppercase                = try(password_policy.value.require_uppercase, true)
      temporary_password_validity_days = try(password_policy.value.temporary_password_validity_days, 2)
    }
  }


  dynamic "schema" {
    for_each = var.schema
    content {
      attribute_data_type      = try(schema.value.attribute_data_type, "String")
      developer_only_attribute = try(schema.value.developer_only_attribute, false)
      mutable                  = try(schema.value.mutable, true)
      name                     = try(schema.value.name, "email")
      required                 = try(schema.value.required, true)

      dynamic "string_attribute_constraints" {
        for_each = [schema.value.string_attribute_constraints]
        content {
          max_length = try(string_attribute_constraints.value.max_length, "2048")
          min_length = try(string_attribute_constraints.value.min_length, "0")
        }
      }
    }
  }

  user_attribute_update_settings {
    attributes_require_verification_before_update = var.user_attributes_require_verification_before_update
  }

  username_configuration {
    case_sensitive = var.username_case_sensitive
  }


  dynamic "verification_message_template" {
    for_each = [var.verification_message_template]
    content {
      default_email_option  = try(verification_message_template.value.default_email_option, "CONFIRM_WITH_CODE")
      email_message         = try(verification_message_template.value.email_message, null)
      email_message_by_link = try(verification_message_template.value.email_message_by_link, null)
      email_subject         = try(verification_message_template.value.email_subject, null)
      email_subject_by_link = try(verification_message_template.value.email_subject_by_link, null)
      sms_message           = try(verification_message_template.value.sms_message, null)
    }
  }


  tags = var.tags
}


resource "aws_cognito_user_pool_client" "this" {

  for_each = { for k, v in var.user_pool_client : k => v if var.create_clients }

  name         = each.key
  user_pool_id = aws_cognito_user_pool.this[0].id

  allowed_oauth_flows                  = try(each.value.allowed_oauth_flows, ["implicit"])
  allowed_oauth_flows_user_pool_client = try(each.value.allowed_oauth_flows_user_pool_client, true)
  allowed_oauth_scopes                 = try(each.value.allowed_oauth_scopes, ["email", "openid", "phone"])

  auth_session_validity  = try(each.value.auth_session_validity, 3)
  access_token_validity  = try(each.value.access_token_validity, 60)
  id_token_validity      = try(each.value.id_token_validity, 60)
  refresh_token_validity = try(each.value.refresh_token_validity, 30)

  default_redirect_uri                          = try(each.value.default_redirect_uri, null)
  enable_propagate_additional_user_context_data = try(each.value.enable_propagate_additional_user_context_data, false)
  enable_token_revocation                       = try(each.value.enable_token_revocation, false)
  explicit_auth_flows                           = try(each.value.explicit_auth_flows, ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"])
  generate_secret                               = try(each.value.generate_secret, false)

  callback_urls = try(each.value.callback_urls, [])
  logout_urls   = try(each.value.logout_urls, [])

  prevent_user_existence_errors = try(each.value.prevent_user_existence_errors, "ENABLED")
  read_attributes               = try(each.value.read_attributes, ["address", "birthdate", "email", "email_verified", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "phone_number_verified", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"])

  supported_identity_providers = try(each.value.supported_identity_providers, ["COGNITO"])
  write_attributes             = try(each.value.write_attributes, ["address", "birthdate", "email", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"])

  dynamic "token_validity_units" {
    for_each = [var.token_validity_units]
    content {
      access_token  = try(token_validity_units.value.access_token, "minutes")
      id_token      = try(token_validity_units.value.id_token, "minutes")
      refresh_token = try(token_validity_units.value.refresh_token, "days")
    }
  }

  depends_on = [
    aws_cognito_identity_provider.this
  ]

}

resource "aws_cognito_user_pool_domain" "this" {
  for_each = { for k, v in var.user_pool_client : k => v if try(v.create_domain, false) }

  domain          = each.value.domain_name
  certificate_arn = try(each.value.certificate_arn, null)
  user_pool_id    = aws_cognito_user_pool.this[0].id
}


data "aws_route53_zone" "this" {
  count = length(var.route53_zone_name) > 0 ? 1 : 0
  name  = var.route53_zone_name
}

resource "aws_route53_record" "this" {
  for_each = { for k, v in var.user_pool_client : k => v if try(length(v.certificate_arn) > 0, false) }

  name    = aws_cognito_user_pool_domain.this[each.key].domain
  type    = "A"
  zone_id = data.aws_route53_zone.this[0].zone_id
  alias {
    evaluate_target_health = false

    name    = aws_cognito_user_pool_domain.this[each.key].cloudfront_distribution
    zone_id = aws_cognito_user_pool_domain.this[each.key].cloudfront_distribution_zone_id
  }
}

###################################################################
# Identity providers
###################################################################

resource "aws_cognito_identity_provider" "this" {
  for_each = { for k, v in var.identity_providers : k => v if var.create_identity_providers }

  attribute_mapping = each.value.attribute_mapping
  idp_identifiers   = each.value.idp_identifiers
  provider_details  = each.value.provider_details
  provider_name     = each.key
  provider_type     = each.key
  user_pool_id      = aws_cognito_user_pool.this[0].id
}

###################################################################
# Resource servers
###################################################################

resource "aws_cognito_resource_server" "resource" {
  for_each   = { for k, v in var.resource_servers : k => v if var.create_resource_servers }
  identifier = each.value.identifier
  name       = each.value.name

  dynamic "scope" {
    for_each = each.value.scope
    content {
      scope_name        = scope.value.scope_name
      scope_description = scope.value.scope_description
    }
  }

  user_pool_id = aws_cognito_user_pool.this[0].id
}

###################################################################
# Cognito user groups
###################################################################

resource "aws_cognito_user_group" "this" {
  for_each     = { for k, v in var.user_groups : k => v if length(var.user_groups) > 0 }
  name         = each.key
  user_pool_id = aws_cognito_user_pool.this[0].id
  description  = try(each.value.description, null)
  precedence   = try(each.value.precedence, null)
  role_arn     = try(each.value.role_arn, null)
}
