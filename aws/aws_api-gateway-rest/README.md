# api-gateway-rest

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_level_2"></a> [level\_2](#module\_level\_2) | ./modules/resources | n/a |
| <a name="module_methods"></a> [methods](#module\_methods) | ./modules/methods | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_api_key.api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_api_key) | resource |
| [aws_api_gateway_authorizer.cognito](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_authorizer) | resource |
| [aws_api_gateway_authorizer.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_authorizer) | resource |
| [aws_api_gateway_base_path_mapping.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_base_path_mapping) | resource |
| [aws_api_gateway_deployment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_domain_name.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_domain_name) | resource |
| [aws_api_gateway_method_settings.all_stages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_model.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_model) | resource |
| [aws_api_gateway_request_validator.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_request_validator) | resource |
| [aws_api_gateway_resource.level_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_api_gateway_usage_plan.stages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan) | resource |
| [aws_api_gateway_usage_plan_key.stages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan_key) | resource |
| [aws_iam_role.authorizer_invocation_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.authorizer_invocation_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_permission.lambda_authorizer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_api_gateway_authorizers.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/api_gateway_authorizers) | data source |
| [aws_cognito_user_pools.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cognito_user_pools) | data source |
| [aws_iam_policy_document.authorizer_invocation_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.invocation_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_lambda_function.lambda_authorizer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_function) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_custom_domain"></a> [api\_gateway\_custom\_domain](#input\_api\_gateway\_custom\_domain) | Custom domain | `string` | `"syncsoul.org"` | no |
| <a name="input_api_gateway_description"></a> [api\_gateway\_description](#input\_api\_gateway\_description) | Description to use for API GW | `string` | `"API"` | no |
| <a name="input_api_gateway_name"></a> [api\_gateway\_name](#input\_api\_gateway\_name) | Name to use for Resources | `string` | `"syncsoul"` | no |
| <a name="input_attach_custom_domain"></a> [attach\_custom\_domain](#input\_attach\_custom\_domain) | Attach custom domain | `bool` | `true` | no |
| <a name="input_authorizer_identity_source"></a> [authorizer\_identity\_source](#input\_authorizer\_identity\_source) | For REQUEST type this may be a comma-separated values | `string` | `"method.request.header.Authorization"` | no |
| <a name="input_cognito_authorizers"></a> [cognito\_authorizers](#input\_cognito\_authorizers) | Create Cognito authorizer | `any` | `{}` | no |
| <a name="input_create_api_gateway"></a> [create\_api\_gateway](#input\_create\_api\_gateway) | Create API Gateway | `bool` | `true` | no |
| <a name="input_create_cognito_authorizer"></a> [create\_cognito\_authorizer](#input\_create\_cognito\_authorizer) | Create Cognito authorizer | `bool` | `false` | no |
| <a name="input_create_deployment"></a> [create\_deployment](#input\_create\_deployment) | Create deployment | `bool` | `true` | no |
| <a name="input_create_lambda_authorizer"></a> [create\_lambda\_authorizer](#input\_create\_lambda\_authorizer) | Create Lambda authorizer | `bool` | `false` | no |
| <a name="input_create_lambda_authorizer_role"></a> [create\_lambda\_authorizer\_role](#input\_create\_lambda\_authorizer\_role) | Create role | `bool` | `false` | no |
| <a name="input_create_lambda_permission_authorizer"></a> [create\_lambda\_permission\_authorizer](#input\_create\_lambda\_permission\_authorizer) | Create permission | `bool` | `true` | no |
| <a name="input_endpoint_configuration_type"></a> [endpoint\_configuration\_type](#input\_endpoint\_configuration\_type) | EDGE, REGIONAL or PRIVATE | `list(any)` | <pre>[<br>  "REGIONAL"<br>]</pre> | no |
| <a name="input_lambda_authorizer_cache"></a> [lambda\_authorizer\_cache](#input\_lambda\_authorizer\_cache) | TTL of cached authorizer results in seconds | `number` | `300` | no |
| <a name="input_lambda_authorizer_name"></a> [lambda\_authorizer\_name](#input\_lambda\_authorizer\_name) | Name of lambda authorizer function | `string` | `""` | no |
| <a name="input_lambda_authorizer_type"></a> [lambda\_authorizer\_type](#input\_lambda\_authorizer\_type) | REQUEST, TOKEN or COGNITO\_USER\_POOLS | `string` | `"REQUEST"` | no |
| <a name="input_methods"></a> [methods](#input\_methods) | List of methods and configuration | `any` | <pre>{<br>  "/{proxy+} ANY": {<br>    "api_key_required": false,<br>    "authorization": "NONE",<br>    "integration": {<br>      "lambda_name": "lambda-s3",<br>      "method": "POST",<br>      "type": "AWS_PROXY",<br>      "uri": "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-s3/invocations"<br>    }<br>  },<br>  "root GET": {<br>    "api_key_required": false,<br>    "authorization": "NONE",<br>    "integration": {<br>      "lambda_name": "lambda-s3",<br>      "method": "POST",<br>      "type": "AWS_PROXY",<br>      "uri": "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-s3/invocations"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_request_models"></a> [request\_models](#input\_request\_models) | Request model to validate body | `any` | <pre>{<br>  "get": {<br>    "content_type": "application/json",<br>    "schema": {<br>      "$schema": "http://json-schema.org/draft-04/schema#",<br>      "properties": {<br>        "category": {<br>          "enum": [<br>            "discovery",<br>            "love",<br>            "pewpew"<br>          ],<br>          "type": "string"<br>        },<br>        "lang": {<br>          "enum": [<br>            "ua",<br>            "en",<br>            "fr"<br>          ],<br>          "type": "string"<br>        },<br>        "quantity": {<br>          "maximum": 100,<br>          "minimum": 1,<br>          "type": "number"<br>        }<br>      },<br>      "required": [<br>        "lang",<br>        "category",<br>        "quantity"<br>      ],<br>      "title": "syncsoul",<br>      "type": "object"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_request_validators"></a> [request\_validators](#input\_request\_validators) | Request validator object | `any` | <pre>{<br>  "body": {<br>    "validate_request_body": true,<br>    "validate_request_parameters": false<br>  }<br>}</pre> | no |
| <a name="input_resources_1"></a> [resources\_1](#input\_resources\_1) | description | `any` | `{}` | no |
| <a name="input_resources_2"></a> [resources\_2](#input\_resources\_2) | description | `any` | `{}` | no |
| <a name="input_stages"></a> [stages](#input\_stages) | Stages and settings | <pre>map(object({<br>    throttling_burst_limit        = optional(number, -1)<br>    throttling_rate_limit         = optional(number, -1)<br>    custom_domain                 = optional(string, "")<br>    custom_domain_certificate_arn = optional(string, "")<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(any)` | `{}` | no |
| <a name="input_usage_plans"></a> [usage\_plans](#input\_usage\_plans) | Settings for keys and usage plans | <pre>map(object({<br>    limit  = optional(number, null)<br>    period = optional(string, null)<br>    offset = optional(number, null)<br><br>    stages   = list(string)<br>    api_keys = list(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_arn"></a> [api\_arn](#output\_api\_arn) | description |
| <a name="output_api_execution_arn"></a> [api\_execution\_arn](#output\_api\_execution\_arn) | description |
| <a name="output_api_gateway_domain_name"></a> [api\_gateway\_domain\_name](#output\_api\_gateway\_domain\_name) | description |
| <a name="output_api_id"></a> [api\_id](#output\_api\_id) | description |
| <a name="output_api_keys"></a> [api\_keys](#output\_api\_keys) | Lambda invocation policy |
| <a name="output_cognito_authorizers"></a> [cognito\_authorizers](#output\_cognito\_authorizers) | Map with cognito authorizers |
| <a name="output_custom_domain"></a> [custom\_domain](#output\_custom\_domain) | Custom domain configuration |
| <a name="output_lambda_authorizer_arn"></a> [lambda\_authorizer\_arn](#output\_lambda\_authorizer\_arn) | ARN of lambda authorizer |
| <a name="output_lambda_authorizer_id"></a> [lambda\_authorizer\_id](#output\_lambda\_authorizer\_id) | ID of lambda authorizer |
| <a name="output_lambda_authorizer_invocation_policy"></a> [lambda\_authorizer\_invocation\_policy](#output\_lambda\_authorizer\_invocation\_policy) | Lambda invocation policy |
| <a name="output_lambda_authorizer_invocation_role"></a> [lambda\_authorizer\_invocation\_role](#output\_lambda\_authorizer\_invocation\_role) | Lambda invocation role to allow API Gateway to invoke it |
| <a name="output_methods"></a> [methods](#output\_methods) | description |
| <a name="output_request_models"></a> [request\_models](#output\_request\_models) | description |
| <a name="output_request_validators"></a> [request\_validators](#output\_request\_validators) | description |
| <a name="output_resources_level_2"></a> [resources\_level\_2](#output\_resources\_level\_2) | description |
| <a name="output_resources_level_2_map"></a> [resources\_level\_2\_map](#output\_resources\_level\_2\_map) | description |
| <a name="output_route53_records"></a> [route53\_records](#output\_route53\_records) | DNS records for custom domain |
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

  name = "syncsoul"

  cors_settings = {
    "method.response.header.Access-Control-Allow-Origin"  = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }
}

terraform {
  source = "git::git@github.com:syncsoul/terraform-modules.git//aws/api-gateway-rest?ref=main"
}

dependency "acm" {
  config_path                             = "../../acm/api-gateway"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    acm_prime_arn = "arn:aws:acm:us-east-1:012345678912:certificate/xxx"
  }
}

dependency "cognito" {
  config_path                             = "../../cognito/user-pools/syncsoul-001"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    congito_user_pool_name = "mock_name"
    cognito_user_clients = {
      syncsoul = {
        allowed_oauth_scopes = ["test", "mock"]
      }
    }
  }
}

dependency "lambda_cards" {
  config_path                             = "../../lambda/s3-backend-001"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    lambda_function_name       = "mock_name"
    lambda_function_invoke_arn = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:0123456789:function:mock-name/invocations"
  }
}

inputs = {
  api_gateway_name            = "${local.environment}-${local.name}"
  endpoint_configuration_type = ["REGIONAL"]

  create_deployment = true

  create_lambda_authorizer = false
  lambda_authorizer_name   = "lambda-simple-authorized"
  # lambda_authorizer_uri = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-simple-authorized/invocations"
  # lambda_authorizer_arn

  create_cognito_authorizer = true
  cognito_authorizers = {
    "sync-001" = {
      cognito_pool_name = dependency.cognito.outputs.congito_user_pool_name
    }
  }


  request_validators = {
    body = {
      validate_request_body       = true
      validate_request_parameters = false
    }
    parameters = {
      validate_request_body       = false
      validate_request_parameters = true
    }
  }

  request_models = {
    getRequest = {
      content_type = "application/json"
      schema = {
        "$schema"  = "http://json-schema.org/draft-04/schema#",
        "title"    = "syncsoul",
        "type"     = "object",
        "required" = ["lang", "category", "quantity"],
        "properties" = {
          "lang" = {
            "type" = "string",
            "enum" = ["ua", "en", "fr"]
          },
          "category" = {
            "type" = "string",
            "enum" = ["discover", "dare", "do", "love", "test"]
          },
          "quantity" = {
            "type"    = "number",
            "minimum" = 1,
            "maximum" = 100
          }
        }
      }
    }
  }

  # resources_1 = ["{proxy+}","generate","update"]
  resources_1 = {
    parent_id = "root"
    paths = {
      # 0 = "{proxy+}"
      1 = "manage"
      2 = "questions"
      3 = "categories"
    }
  }

  resources_2 = {
    parent_id = "/manage"
    paths = {
      0 = "questions"
      1 = "categories"
    }
  }

  methods = {

    "root OPTIONS" = {
      authorization    = "NONE"
      api_key_required = false

      response_parameters = local.cors_settings

      integration = {
        # lambda_name = dependency.lambda_cards.outputs.lambda_function_name
        # method      = "OPTIONS"
        type = "MOCK"

        response = {
          type = "cors"
          response_parameters = {
            "method.response.header.Access-Control-Allow-Origin"  = "'*'", # replace with hostname of frontend (CloudFront)
            "method.response.header.Access-Control-Allow-Headers" = "'Content-Type'",
            "method.response.header.Access-Control-Allow-Methods" = "'GET, POST, PUT, DELETE, OPTIONS'" # remove or add HTTP methods as needed
          }
        }
      }
    }

    "/questions GET" = {
      authorization    = "NONE"
      api_key_required = false

      # request_model = { "application/json" = "getRequest" }
      request_validator = "parameters"
      request_parameters = {
        "method.request.querystring.lang"     = true
        "method.request.querystring.category" = true
        # "method.request.querystring.quantity" = true
      }


      response_parameters = local.cors_settings

      integration = {
        lambda_name = dependency.lambda_cards.outputs.lambda_function_name
        method      = "POST"
        type        = "AWS_PROXY"
        uri         = dependency.lambda_cards.outputs.lambda_function_invoke_arn
      }
    }

    # "root POST" = {
    #   authorization    = "NONE"
    #   api_key_required = false

    #   request_model       = { "application/json" = "getRequest" }
    #   request_validator   = "body"
    #   response_parameters = local.cors_settings

    #   integration = {
    #     lambda_name = dependency.lambda_cards.outputs.lambda_function_name
    #     method      = "POST"
    #     type        = "AWS_PROXY"
    #     uri         = dependency.lambda_cards.outputs.lambda_function_invoke_arn
    #   }
    # }

    # "/{proxy+} ANY" = {
    #   authorization    = "NONE"
    #   api_key_required = false

    #   # request_model = {}
    #   # request_validator = "body"
    #   response_parameters = local.cors_settings

    #   integration = {
    #     lambda_name = dependency.lambda_cards.outputs.lambda_function_name
    #     method      = "POST"
    #     type        = "AWS_PROXY"
    #     uri         = dependency.lambda_cards.outputs.lambda_function_invoke_arn
    #   }
    # }

    "/manage/questions GET" = {
      authorization        = "COGNITO_USER_POOLS"
      authorizer_name      = "sync-001"
      authorization_scopes = dependency.cognito.outputs.cognito_user_clients.syncsoul.allowed_oauth_scopes
      api_key_required     = false

      # request_model = {}
      # request_validator = "body"
      response_parameters = local.cors_settings

      integration = {
        lambda_name = "s3-presigned-post-url-generator"
        method      = "POST"
        type        = "AWS_PROXY"
        uri         = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:s3-presigned-post-url-generator/invocations"
      }
    }
  }

  attach_custom_domain      = true
  api_gateway_custom_domain = local.domain_name

  stages = {
    "dev" = {
      throttling_burst_limit = 10
      throttling_rate_limit  = 5

      custom_domain                 = "dev-api.${local.domain_name}"
      custom_domain_certificate_arn = dependency.acm.outputs.acm_prime_arn
    },
    "test" = {
      throttling_burst_limit = 11
      throttling_rate_limit  = 6

      api_key_required = true
      api_key_limit    = 20
      api_key_period   = "WEEK"

      # custom_domain                 = "test-api.mydomain"
      # custom_domain_certificate_arn = "arn"
    },
    "prod" = {
      throttling_burst_limit = 12
      throttling_rate_limit  = 7

      api_key_required = true
      api_key_limit    = 10
      api_key_period   = "DAY"

      # custom_domain                 = "api.mydomain"
      # custom_domain_certificate_arn = "arn"
    }
  }

}
```
