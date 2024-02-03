
data "aws_api_gateway_rest_api" "this" {
  name = var.api_name
}

data "aws_api_gateway_resource" "this" {
  for_each = { for k, v in var.methods : k => v if element(split(" ", k), 0) != "root" }

  rest_api_id = var.api_id
  path        = element(split(" ", each.key), 0)

}

data "aws_api_gateway_authorizer" "this" {
  count = length(var.authorizers)

  rest_api_id   = data.aws_api_gateway_rest_api.this.id
  authorizer_id = var.authorizers[count.index]
}

locals {
  authorizer_ids = { for k, v in data.aws_api_gateway_authorizer.this : v.name => {
    id = v.id
    }
  }
}

resource "aws_api_gateway_method" "this" {

  for_each = var.methods

  rest_api_id = var.api_id # aws_api_gateway_rest_api.this[0].id
  resource_id = element(split(" ", each.key), 0) == "root" ? data.aws_api_gateway_rest_api.this.root_resource_id : data.aws_api_gateway_resource.this[each.key].id
  http_method = try(element(split(" ", each.key), 1), "GET") #"GET"

  authorization        = try(each.value.authorization, "NONE") #"NONE"
  authorizer_id        = try(local.authorizer_ids[each.value.authorizer_name].id, null)
  authorization_scopes = try(each.value.authorization, "") == "COGNITO_USER_POOLS" ? try(each.value.authorization_scopes, null) : null

  api_key_required = try(each.value.api_key_required, false) # true

  request_models       = try(each.value.request_model, {})
  request_validator_id = try(var.request_validators[each.value.request_validator].id, null)
  request_parameters   = try(each.value.request_parameters, {})

  lifecycle {
    ignore_changes = [
      resource_id
    ]
  }

}

resource "aws_api_gateway_integration" "this" {
  for_each = var.methods

  rest_api_id             = var.api_id
  resource_id             = element(split(" ", each.key), 0) == "root" ? data.aws_api_gateway_rest_api.this.root_resource_id : data.aws_api_gateway_resource.this[each.key].id
  http_method             = try(element(split(" ", each.key), 1), "GET")
  integration_http_method = try(each.value.integration.method, null) #  Lambda function can only be invoked via POST
  type                    = try(each.value.integration.type, "AWS_PROXY")
  uri                     = try(each.value.integration.uri, null) # "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:957362393943:function:lambda-s3/invocations"
  content_handling        = try(each.value.integration.content_handling, null)

  depends_on = [
    aws_api_gateway_method.this
  ]

  lifecycle {
    ignore_changes = [
      resource_id
    ]
  }

}

resource "aws_api_gateway_method_response" "this" {
  for_each = var.methods

  rest_api_id = var.api_id
  resource_id = element(split(" ", each.key), 0) == "root" ? data.aws_api_gateway_rest_api.this.root_resource_id : data.aws_api_gateway_resource.this[each.key].id
  http_method = try(element(split(" ", each.key), 1), "GET")

  status_code = try(each.value.status_code, "200")

  response_models = try(each.value.response_models,
    {
      "application/json" = "Empty"
    }
  )
  response_parameters = try(each.value.response_parameters, {})

  depends_on = [
    aws_api_gateway_integration.this
  ]

  lifecycle {
    ignore_changes = [
      resource_id
    ]
  }
}

resource "aws_lambda_permission" "this" {
  for_each = { for k, v in var.methods : k => v if length(try(v.integration.lambda_name, "")) > 0 }

  statement_id  = "AllowExecutionFromAPIGateway-${replace(each.key, "/\\W|_|\\s/", "-")}"
  action        = "lambda:InvokeFunction"
  function_name = each.value.integration.lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${data.aws_api_gateway_rest_api.this.execution_arn}/*"

  lifecycle {
    ignore_changes = [
      source_arn
    ]
  }

}

resource "aws_api_gateway_integration_response" "this" {
  for_each = { for k, v in var.methods : k => v if length(try(v.integration.response, {})) > 0 }

  rest_api_id         = var.api_id
  resource_id         = element(split(" ", each.key), 0) == "root" ? data.aws_api_gateway_rest_api.this.root_resource_id : data.aws_api_gateway_resource.this[each.key].id
  http_method         = try(element(split(" ", each.key), 1), "GET")
  status_code         = try(each.value.status_code, "200")
  response_parameters = try(each.value.integration.response.response_parameters, {})

  depends_on = [
    aws_api_gateway_integration.this,
    aws_api_gateway_method_response.this
  ]

  lifecycle {
    ignore_changes = [
      resource_id
    ]
  }
}
