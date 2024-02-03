# cognito_user_pools

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_identity_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_identity_provider) | resource |
| [aws_cognito_resource_server.resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_resource_server) | resource |
| [aws_cognito_user_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_group) | resource |
| [aws_cognito_user_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_cognito_user_pool_client.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |
| [aws_cognito_user_pool_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_admin_create_user_only"></a> [allow\_admin\_create\_user\_only](#input\_allow\_admin\_create\_user\_only) | Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app | `bool` | `false` | no |
| <a name="input_auto_verified_attributes"></a> [auto\_verified\_attributes](#input\_auto\_verified\_attributes) | Auto-verified list of attributes | `list(any)` | <pre>[<br>  "email"<br>]</pre> | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create user pool or not | `bool` | `true` | no |
| <a name="input_create_clients"></a> [create\_clients](#input\_create\_clients) | Create clients or not | `bool` | `true` | no |
| <a name="input_create_identity_providers"></a> [create\_identity\_providers](#input\_create\_identity\_providers) | Whether to create IDP or not | `bool` | `true` | no |
| <a name="input_create_resource_servers"></a> [create\_resource\_servers](#input\_create\_resource\_servers) | Whether to create resource servers or not | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Deletion protecion, possible values ACTIVE and INACTIVE | `string` | `"ACTIVE"` | no |
| <a name="input_email_configuration"></a> [email\_configuration](#input\_email\_configuration) | Email configuration set name from SES | `map(any)` | <pre>{<br>  "configuration_set": null,<br>  "email_sending_account": "COGNITO_DEFAULT",<br>  "from_email_address": null,<br>  "reply_to_email_address": null,<br>  "source_arn": null<br>}</pre> | no |
| <a name="input_identity_providers"></a> [identity\_providers](#input\_identity\_providers) | Map with IDP configuration | `any` | `{}` | no |
| <a name="input_invite_message_template"></a> [invite\_message\_template](#input\_invite\_message\_template) | Invite message template structure | `any` | <pre>{<br>  "email_message": null,<br>  "email_subject": null,<br>  "sms_message": null<br>}</pre> | no |
| <a name="input_mfa_configuration"></a> [mfa\_configuration](#input\_mfa\_configuration) | MFA configuration | `string` | `"OFF"` | no |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | Password policy | `any` | <pre>{<br>  "minimum_length": 8,<br>  "require_lowercase": true,<br>  "require_numbers": true,<br>  "require_symbols": true,<br>  "require_uppercase": true,<br>  "temporary_password_validity_days": 7<br>}</pre> | no |
| <a name="input_recovery_mechanism"></a> [recovery\_mechanism](#input\_recovery\_mechanism) | List of user recovery mechanisms | `any` | `[]` | no |
| <a name="input_resource_servers"></a> [resource\_servers](#input\_resource\_servers) | Map with resource servers configuration | `any` | `{}` | no |
| <a name="input_route53_zone_name"></a> [route53\_zone\_name](#input\_route53\_zone\_name) | Zone 53 zone name | `string` | `""` | no |
| <a name="input_schema"></a> [schema](#input\_schema) | Schema configuration | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(any)` | `{}` | no |
| <a name="input_token_validity_units"></a> [token\_validity\_units](#input\_token\_validity\_units) | Map with IDP configuration | `any` | `{}` | no |
| <a name="input_user_attributes_require_verification_before_update"></a> [user\_attributes\_require\_verification\_before\_update](#input\_user\_attributes\_require\_verification\_before\_update) | A list of attributes requiring verification before update. If set, the provided value(s) must also be set in auto\_verified\_attributes. Valid values: email, phone\_number | `list(any)` | <pre>[<br>  "email"<br>]</pre> | no |
| <a name="input_user_groups"></a> [user\_groups](#input\_user\_groups) | Cognito groups configuration | `map(any)` | `{}` | no |
| <a name="input_user_pool_client"></a> [user\_pool\_client](#input\_user\_pool\_client) | Configuration block for client | `any` | `{}` | no |
| <a name="input_user_pool_name"></a> [user\_pool\_name](#input\_user\_pool\_name) | User pool name | `string` | `"default-name"` | no |
| <a name="input_username_attributes"></a> [username\_attributes](#input\_username\_attributes) | Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias\_attributes | `list(any)` | <pre>[<br>  "email"<br>]</pre> | no |
| <a name="input_username_case_sensitive"></a> [username\_case\_sensitive](#input\_username\_case\_sensitive) | Whether username case sensitivity will be applied for all users in the user pool through Cognito APIs | `bool` | `false` | no |
| <a name="input_verification_message_template"></a> [verification\_message\_template](#input\_verification\_message\_template) | Template for notifications | `any` | <pre>{<br>  "default_email_option": "CONFIRM_WITH_CODE",<br>  "email_message": null,<br>  "email_message_by_link": null,<br>  "email_subject": null,<br>  "email_subject_by_link": null,<br>  "sms_message": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognito_idps"></a> [cognito\_idps](#output\_cognito\_idps) | Cognito identity providers |
| <a name="output_cognito_user_clients"></a> [cognito\_user\_clients](#output\_cognito\_user\_clients) | Cognito user pool clients |
| <a name="output_congito_user_pool_arn"></a> [congito\_user\_pool\_arn](#output\_congito\_user\_pool\_arn) | Cognito user pool id |
| <a name="output_congito_user_pool_custom_domain"></a> [congito\_user\_pool\_custom\_domain](#output\_congito\_user\_pool\_custom\_domain) | Cognito user pool id |
| <a name="output_congito_user_pool_domain"></a> [congito\_user\_pool\_domain](#output\_congito\_user\_pool\_domain) | Cognito user pool id |
| <a name="output_congito_user_pool_endpoint"></a> [congito\_user\_pool\_endpoint](#output\_congito\_user\_pool\_endpoint) | Cognito user pool id |
| <a name="output_congito_user_pool_id"></a> [congito\_user\_pool\_id](#output\_congito\_user\_pool\_id) | Cognito user pool id |
| <a name="output_congito_user_pool_name"></a> [congito\_user\_pool\_name](#output\_congito\_user\_pool\_name) | Cognito user pool id |
| <a name="output_route_53"></a> [route\_53](#output\_route\_53) | Route53 configuration |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### Example:

```
include "root" {
  path = find_in_parent_folders()
}

locals {
  environment_config = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  environment        = local.environment_config.locals.environment
  region             = local.environment_config.locals.aws_region
  domain_name        = local.environment_config.locals.domain_name
}

dependency "acm" {
  config_path                             = "../../../acm/cognito-user-pool-001"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    acm_prime_arn          = "arn:aws:acm:us-east-1:012345678912:certificate/xxx"
    acm_prime_domain_names = ["value"]
  }
}

dependency "ssm_ps_google" {
  config_path                             = "../../../ssm/ps/google"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    ssm_parameter_values = {
      google_client_id = "mock"
      google_client_secret = "mock"
    }
  }
}

dependency "ssm_ps_facebook" {
  config_path                             = "../../../ssm/ps/facebook"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    ssm_parameter_values = {
      facebook_client_id = "mock"
      facebook_client_secret = "mock"
    }
  }
}

terraform {
  source = "git::git@github.com:syncsoul/terraform-modules.git//aws/cognito_user_pools?ref=main"
}

inputs = {
  user_pool_name = "my-testing-pool"
  route53_zone_name = "mydomain.com"

  deletion_protection = "INACTIVE"
  mfa_configuration   = "OFF"

  auto_verified_attributes = ["email"]
  username_attributes      = ["email"]

  recovery_mechanism = [{
    priority = 1
    name     = "verified_email"
  }]

  allow_admin_create_user_only = false

  email_configuration = {
    configuration_set      = null
    email_sending_account  = "COGNITO_DEFAULT"
    from_email_address     = null
    reply_to_email_address = null
    source_arn             = null
  }

  password_policy = {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 2
  }

  schema = [{
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true
    string_attribute_constraints = {
      max_length = "2048"
      min_length = "0"
    }
  }]

  user_attributes_require_verification_before_update = ["email"]
  username_case_sensitive                            = false

  verification_message_template = {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = null
    email_message_by_link = null
    email_subject         = null
    email_subject_by_link = null
    sms_message           = null
  }
  invite_message_template = {}

  create_resource_servers = true
  resource_servers = {
    "api-gw" = {
      identifier = "s3-presign"
      name       = "s3-presign"
      scope = [
        {
          scope_name        = "create"
          scope_description = "api operations"
        },
        # {
        #   scope_name = "write"
        #   scope_description = "write products"
        # }
      ]
    }
  }

  #### CLIENT ####
  create_clients = true
  user_pool_client = {
    "syncsoul" = {
      allowed_oauth_flows                  = ["implicit"]
      allowed_oauth_flows_user_pool_client = true
      allowed_oauth_scopes                 = ["email", "openid", "phone", "s3-presign/create"]

      auth_session_validity  = 3
      access_token_validity  = 60
      id_token_validity      = 60
      refresh_token_validity = 14

      explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
      generate_secret     = false

      callback_urls = ["https://dev.mydomain.com/callback"]
      logout_urls   = ["https://dev.mydomain.com/logout"]

      read_attributes              = ["address", "birthdate", "email", "email_verified", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "phone_number_verified", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"]
      write_attributes             = ["address", "birthdate", "email", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"]
      supported_identity_providers = ["COGNITO", "Google", "Facebook"]

      # token_validity_units = {
      #   access_token  = "minutes"
      #   id_token      = "minutes"
      #   refresh_token = "days"
      # }

      create_domain   = true
      certificate_arn = dependency.acm.outputs.acm_prime_arn
      domain_name     = dependency.acm.outputs.acm_prime_domain_names[0]
    }
  }

  identity_providers = {

    "Google" = {
      provider_name = "Google"
      provider_type = "Google"

      attribute_mapping = {
        email    = "email"
        name     = "name"
        username = "sub"
      }
      provider_details = {
        attributes_url                = "https://people.googleapis.com/v1/people/me?personFields="
        attributes_url_add_attributes = "true"
        authorize_scopes              = "profile email openid"
        authorize_url                 = "https://accounts.google.com/o/oauth2/v2/auth"
        client_id                     = dependency.ssm_ps_google.outputs.ssm_parameter_values.google_client_id
        client_secret                 = dependency.ssm_ps_google.outputs.ssm_parameter_values.google_client_secret
        oidc_issuer                   = "https://accounts.google.com"
        token_request_method          = "POST"
        token_url                     = "https://www.googleapis.com/oauth2/v4/token"
      }

      idp_identifiers = []

    }

    "Facebook" = {
      provider_name = "Facebook"
      provider_type = "Facebook"

      attribute_mapping = {
        email    = "email"
        name     = "name"
        username = "id"
      }
      provider_details = {
      api_version                   = "v17.0"
      attributes_url                = "https://graph.facebook.com/v17.0/me?fields="
      attributes_url_add_attributes = "true"
      authorize_scopes              = "public_profile, email"
      authorize_url                 = "https://www.facebook.com/v17.0/dialog/oauth"
      client_id                     = dependency.ssm_ps_facebook.outputs.ssm_parameter_values.facebook_client_id
      client_secret                 = dependency.ssm_ps_facebook.outputs.ssm_parameter_values.facebook_client_secret
      token_request_method          = "GET"
      token_url                     = "https://graph.facebook.com/v17.0/oauth/access_token"
    }

      idp_identifiers = []

    }
  }

}

```
