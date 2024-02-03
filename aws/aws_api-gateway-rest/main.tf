### API GATEWAY ###

resource "aws_api_gateway_rest_api" "this" {

  count       = var.create_api_gateway ? 1 : 0
  name        = var.api_gateway_name
  description = var.api_gateway_description
  tags        = var.tags
  endpoint_configuration {
    types = var.endpoint_configuration_type
  }
  disable_execute_api_endpoint = false
}

# module "level_1" {
#   source = "./modules/resources"

#   api_id    = aws_api_gateway_rest_api.this[0].id
#   parent_id = var.resources_1.parent_id == "root" ? aws_api_gateway_rest_api.this[0].root_resource_id : var.resources_1.parent_id
#   resources = var.resources_1.paths
# }

resource "aws_api_gateway_resource" "level_1" {
  for_each = { for k, v in var.resources_1.paths : k => v }

  rest_api_id = aws_api_gateway_rest_api.this[0].id
  parent_id   = aws_api_gateway_rest_api.this[0].root_resource_id
  path_part   = each.value
}



module "level_2" {
  source = "./modules/resources"

  api_id    = aws_api_gateway_rest_api.this[0].id
  parent_id = var.resources_2.parent_id == "root" ? aws_api_gateway_rest_api.this[0].root_resource_id : var.resources_2.parent_id
  resources = var.resources_2.paths

  depends_on = [
    aws_api_gateway_resource.level_1
  ]
}

data "aws_api_gateway_authorizers" "all" {
  rest_api_id = aws_api_gateway_rest_api.this[0].id
}

module "methods" {
  source = "./modules/methods"

  api_id      = aws_api_gateway_rest_api.this[0].id
  api_name    = var.api_gateway_name
  methods     = var.methods
  authorizers = data.aws_api_gateway_authorizers.all.ids

  request_validators = try(aws_api_gateway_request_validator.this, {})

  depends_on = [
    aws_api_gateway_resource.level_1,
    module.level_2
    # aws_api_gateway_request_validator.this,
    # aws_api_gateway_model.this

  ]
}




resource "aws_api_gateway_deployment" "this" {
  count       = var.create_deployment ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.this[0].id

  triggers = {
    redeployment = sha1(jsonencode([
      module.methods
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  for_each = var.stages

  deployment_id = aws_api_gateway_deployment.this[0].id
  rest_api_id   = aws_api_gateway_rest_api.this[0].id
  stage_name    = each.key # Any Name you wish
  tags          = var.tags
}

resource "aws_api_gateway_method_settings" "all_stages" {
  for_each = var.stages

  rest_api_id = aws_api_gateway_rest_api.this[0].id
  stage_name  = each.key
  method_path = "*/*"

  settings {
    throttling_burst_limit = try(each.value.throttling_burst_limit, 25)
    throttling_rate_limit  = try(each.value.throttling_rate_limit, 15)
  }

  depends_on = [
    aws_api_gateway_stage.this
  ]
}


###############################################################################
# Lambda authorizer configuration
###############################################################################

data "aws_lambda_function" "lambda_authorizer" {
  count         = length(var.lambda_authorizer_name) > 0 ? 1 : 0
  function_name = var.lambda_authorizer_name
}

resource "aws_api_gateway_authorizer" "lambda" {
  count                            = var.create_lambda_authorizer ? 1 : 0
  name                             = "${var.api_gateway_name}-lambda-authorizer"
  rest_api_id                      = aws_api_gateway_rest_api.this[0].id
  authorizer_uri                   = data.aws_lambda_function.lambda_authorizer[0].invoke_arn
  authorizer_credentials           = var.create_lambda_authorizer_role ? aws_iam_role.authorizer_invocation_role[0].arn : null
  type                             = var.lambda_authorizer_type
  identity_source                  = var.authorizer_identity_source
  authorizer_result_ttl_in_seconds = var.lambda_authorizer_cache # 300 default
}

### LAMBDA AUTHORIZER PERMISSION

resource "aws_lambda_permission" "lambda_authorizer" {
  count         = var.create_lambda_permission_authorizer && var.create_lambda_authorizer ? 1 : 0
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_authorizer_name #"lambda-simple-authorized"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this[0].execution_arn}/*"
}


### LAMBDA AUTHORIZER ROLE

data "aws_iam_policy_document" "invocation_assume_role" {
  count = var.create_lambda_authorizer_role && var.create_lambda_authorizer ? 1 : 0
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "authorizer_invocation_policy" {
  count = var.create_lambda_authorizer_role && var.create_lambda_authorizer ? 1 : 0
  statement {
    effect    = "Allow"
    actions   = ["lambda:InvokeFunction"]
    resources = [data.aws_lambda_function.lambda_authorizer[0].arn]
  }
}

resource "aws_iam_role" "authorizer_invocation_role" {
  count              = var.create_lambda_authorizer_role && var.create_lambda_authorizer ? 1 : 0
  name               = "${var.api_gateway_name}-lambda-authorizer-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.invocation_assume_role[0].json
}

resource "aws_iam_role_policy" "authorizer_invocation_policy" {
  count  = var.create_lambda_authorizer_role && var.create_lambda_authorizer ? 1 : 0
  name   = "${var.api_gateway_name}-lambda-authorizer-policy"
  role   = aws_iam_role.authorizer_invocation_role[0].id
  policy = data.aws_iam_policy_document.authorizer_invocation_policy[0].json
}

###############################################################################
# Cognito authorizer configuration
###############################################################################

resource "aws_api_gateway_authorizer" "cognito" {
  for_each = { for k, v in var.cognito_authorizers : k => v if var.create_cognito_authorizer }

  name            = each.key
  rest_api_id     = aws_api_gateway_rest_api.this[0].id
  type            = "COGNITO_USER_POOLS"
  provider_arns   = data.aws_cognito_user_pools.this[each.key].arns
  identity_source = var.authorizer_identity_source
}

data "aws_cognito_user_pools" "this" {
  for_each = { for k, v in var.cognito_authorizers : k => v if var.create_cognito_authorizer }

  name = each.value.cognito_pool_name
}


###############################################################################
# API key configuration
###############################################################################

locals {
  api_keys = flatten([
    for plan, value in var.usage_plans : [
      for key in value.api_keys : "${plan}-${key}"
    ]
  ])
}

resource "aws_api_gateway_api_key" "api_key" {
  for_each = toset(local.api_keys)
  name     = "${var.api_gateway_name}-${each.key}"
}

resource "aws_api_gateway_usage_plan" "stages" {
  for_each = var.usage_plans

  name        = "usage-plan-${each.key}"
  description = "${each.key} description"

  dynamic "api_stages" {
    for_each = each.value.stages
    content {
      api_id = aws_api_gateway_rest_api.this[0].id
      stage  = api_stages.value
    }
  }

  dynamic "quota_settings" {
    for_each = try(each.value.limit, 0) > 0 ? [1] : []
    content {
      limit  = try(each.value.limit, null)
      offset = try(each.value.offset, null)
      period = try(each.value.period, null)
    }
  }

  dynamic "throttle_settings" {
    for_each = try(each.value.burst_limit, 0) > 0 ? [1] : []
    content {
      burst_limit = try(each.value.burst_limit, null)
      rate_limit  = try(each.value.rate_limit, null)
    }
  }

  depends_on = [
    aws_api_gateway_stage.this
  ]
}

resource "aws_api_gateway_usage_plan_key" "stages" {
  for_each = toset(local.api_keys)

  key_id        = aws_api_gateway_api_key.api_key[each.value].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.stages[split("-", each.value)[0]].id

  depends_on = [
    aws_api_gateway_usage_plan.stages
  ]
}



###############################################################################
# Domain name configuration
###############################################################################

resource "aws_api_gateway_domain_name" "this" {
  for_each = { for k, v in var.stages : k => v if length(try(v.custom_domain, "")) > 0 }

  domain_name              = each.value.custom_domain
  regional_certificate_arn = each.value.custom_domain_certificate_arn
  security_policy          = try(each.value.security_policy, "TLS_1_2")
  tags                     = var.tags

  endpoint_configuration {
    types = var.endpoint_configuration_type
  }
}

# Get HostedZone details for Domain name
data "aws_route53_zone" "this" {
  count        = var.attach_custom_domain ? 1 : 0
  name         = var.api_gateway_custom_domain
  private_zone = false
}

# Register Custom Domain name in Route53
resource "aws_route53_record" "this" {
  for_each = { for k, v in var.stages : k => v if length(try(v.custom_domain, "")) > 0 }

  name    = aws_api_gateway_domain_name.this[each.key].domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.this[0].id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.this[each.key].regional_domain_name
    zone_id                = aws_api_gateway_domain_name.this[each.key].regional_zone_id
  }
}

resource "aws_api_gateway_base_path_mapping" "this" {
  for_each = { for k, v in var.stages : k => v if length(try(v.custom_domain, "")) > 0 }

  domain_name = aws_api_gateway_domain_name.this[each.key].domain_name
  api_id      = aws_api_gateway_rest_api.this[0].id
  stage_name  = aws_api_gateway_stage.this[each.key].stage_name
  base_path   = null # null means root of api domain name
}

###############################################################################
# Request Models configuration
###############################################################################

resource "aws_api_gateway_request_validator" "this" {
  for_each = try(var.request_validators, {})

  name                        = "${each.key}-request-validator"
  rest_api_id                 = aws_api_gateway_rest_api.this[0].id
  validate_request_body       = try(each.value.validate_request_body, false)
  validate_request_parameters = try(each.value.validate_request_parameters, false)
}

resource "aws_api_gateway_model" "this" {
  for_each = try(var.request_models, {})

  name         = each.key
  rest_api_id  = aws_api_gateway_rest_api.this[0].id
  description  = "${each.key} - Model schema"
  content_type = try(each.value.content_type, "application/json")

  schema = jsonencode(each.value.schema)
}
