data "aws_iam_policy_document" "assume_role" {
  count = var.create_default_role ? 1 : 0
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "basic_lambda_role" {
  count              = var.create_default_role ? 1 : 0
  name               = var.basic_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}

resource "aws_iam_role_policy_attachment" "basic_lambda_attachment" {
  count      = var.create_default_role ? 1 : 0
  role       = aws_iam_role.basic_lambda_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "dummy" {
  count       = var.create_dummy_lambda ? 1 : 0
  type        = "zip"
  output_path = "/tmp/dummy_lambda.zip"

  source {
    content  = var.dummy_content
    filename = var.dummy_filename
  }
}

resource "aws_lambda_function" "this" {
  count         = var.create_lambda ? 1 : 0
  filename      = var.create_dummy_lambda ? data.archive_file.dummy[0].output_path : var.filename
  function_name = var.lambda_name
  role          = var.create_default_role ? aws_iam_role.basic_lambda_role[0].arn : var.lambda_role
  handler       = var.handler #"index.handler"
  timeout       = var.timeout

  layers = var.layers

  source_code_hash = var.ignore_source_code_hash ? null : var.create_dummy_lambda ? data.archive_file.dummy[0].output_base64sha256 : null

  runtime = var.runtime #"nodejs18.x"

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
    }
  }

  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage_size == null ? [] : [true]

    content {
      size = var.ephemeral_storage_size
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids = var.vpc_security_group_ids
      subnet_ids         = var.vpc_subnet_ids
    }
  }

  tags = var.tags

  depends_on = [
    data.archive_file.dummy,
    aws_iam_role.basic_lambda_role
  ]

}

locals {
  custom_role_policy_arns = var.create_custom_policies ? merge(var.policies, module.policies[0].policy_arn) : var.policies
}


module "policies" {
  count = var.create_custom_policies ? 1 : 0

  source   = "../iam/iam-policies"
  policies = var.custom_policies
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for k, v in local.custom_role_policy_arns : k => v if var.create_custom_policies }

  role       = aws_iam_role.basic_lambda_role[0].name
  policy_arn = each.value
}
