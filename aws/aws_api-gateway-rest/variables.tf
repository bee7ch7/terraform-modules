variable "create_api_gateway" {
  description = "Create API Gateway"
  type        = bool
  default     = true
}

variable "api_gateway_name" {
  description = "Name to use for Resources"
  default     = "syncsoul"
  type        = string
}

variable "api_gateway_description" {
  description = "Description to use for API GW"
  default     = "API"
  type        = string
}

variable "endpoint_configuration_type" {
  description = "EDGE, REGIONAL or PRIVATE"
  type        = list(any)
  default     = ["REGIONAL"]
}

variable "resources_1" {
  type        = any
  default     = {}
  description = "description"
}

variable "resources_2" {
  type        = any
  default     = {}
  description = "description"
}

variable "methods" {
  type        = any
  description = "List of methods and configuration"
  default = {
    "root GET" = {
      authorization    = "NONE"
      api_key_required = false

      integration = {
        lambda_name = "lambda-s3"
        method      = "POST"
        type        = "AWS_PROXY"
        uri         = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-s3/invocations"
      }
    }

    "/{proxy+} ANY" = {
      authorization    = "NONE"
      api_key_required = false

      integration = {
        lambda_name = "lambda-s3"
        method      = "POST"
        type        = "AWS_PROXY"
        uri         = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-s3/invocations"
      }
    }
  }
}

variable "stages" {
  type = map(object({
    throttling_burst_limit        = optional(number, -1)
    throttling_rate_limit         = optional(number, -1)
    custom_domain                 = optional(string, "")
    custom_domain_certificate_arn = optional(string, "")
  }))
  description = "Stages and settings"
  default     = {}
}

variable "usage_plans" {
  type = map(object({
    limit  = optional(number, null)
    period = optional(string, null)
    offset = optional(number, null)

    stages   = list(string)
    api_keys = list(string)
  }))
  description = "Settings for keys and usage plans"
  default     = {}
}

variable "create_deployment" {
  type        = bool
  default     = true
  description = "Create deployment"
}

variable "create_lambda_authorizer" {
  type        = bool
  default     = false
  description = "Create Lambda authorizer"
}

variable "create_cognito_authorizer" {
  type        = bool
  default     = false
  description = "Create Cognito authorizer"
}

variable "cognito_authorizers" {
  type        = any
  default     = {}
  description = "Create Cognito authorizer"
}

variable "lambda_authorizer_name" {
  type        = string
  default     = ""
  description = "Name of lambda authorizer function"
}

variable "lambda_authorizer_type" {
  type        = string
  default     = "REQUEST"
  description = "REQUEST, TOKEN or COGNITO_USER_POOLS"
}

variable "authorizer_identity_source" {
  type        = string
  default     = "method.request.header.Authorization"
  description = "For REQUEST type this may be a comma-separated values"
}

variable "lambda_authorizer_cache" {
  type        = number
  default     = 300
  description = "TTL of cached authorizer results in seconds"
}

### role or lambda permission, can be both
variable "create_lambda_authorizer_role" {
  type        = bool
  default     = false
  description = "Create role"
}

### role or lambda permission, can be both
variable "create_lambda_permission_authorizer" {
  type        = bool
  default     = true
  description = "Create permission"
}

# variable "lambda_authorizer_uri" {
#   description = "Invocation URL of Lambda"
#   type        = string
#   default     = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-simple-authorized/invocations"
# }

# variable "lambda_authorizer_arn" {
#   description = "Lambda authorizer arn"
#   type        = string
#   default     = "arn:aws:lambda:eu-central-1:957362393943:function:lambda-simple-authorized"
# }

variable "request_validators" {
  type        = any
  description = "Request validator object"
  default = {
    body = {
      validate_request_body       = true
      validate_request_parameters = false
    }
  }
}

variable "request_models" {
  type        = any
  description = "Request model to validate body"
  default = {
    get = {
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
            "enum" = ["discovery", "love", "pewpew"]
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
}

variable "tags" {
  description = "Default tags"
  type        = map(any)
  default     = {}
}

variable "attach_custom_domain" {
  type        = bool
  default     = true
  description = "Attach custom domain"
}

variable "api_gateway_custom_domain" {
  type        = string
  default     = "syncsoul.org"
  description = "Custom domain"
}
