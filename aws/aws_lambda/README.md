# lambda

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.29 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.29 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_policies"></a> [policies](#module\_policies) | ../iam/iam-policies | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.basic_lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.basic_lambda_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.dummy](https://registry.terraform.io/providers/hashicorp/archive/2.4.0/docs/data-sources/file) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basic_role_name"></a> [basic\_role\_name](#input\_basic\_role\_name) | Whether to create default lambda permissions or not | `string` | `"default_role_name"` | no |
| <a name="input_create_custom_policies"></a> [create\_custom\_policies](#input\_create\_custom\_policies) | description | `bool` | `false` | no |
| <a name="input_create_default_role"></a> [create\_default\_role](#input\_create\_default\_role) | Whether to create default lambda permissions or not | `bool` | `false` | no |
| <a name="input_create_dummy_lambda"></a> [create\_dummy\_lambda](#input\_create\_dummy\_lambda) | Whether to create dummy lambda permissions or not | `bool` | `false` | no |
| <a name="input_create_lambda"></a> [create\_lambda](#input\_create\_lambda) | Whether to create default lambda permissions or not | `bool` | `true` | no |
| <a name="input_custom_policies"></a> [custom\_policies](#input\_custom\_policies) | The URL of the identity provider. Corresponds to the iss claim | `map(any)` | `{}` | no |
| <a name="input_dummy_content"></a> [dummy\_content](#input\_dummy\_content) | Whether to create dummy lambda permissions or not | `string` | `"hello"` | no |
| <a name="input_dummy_filename"></a> [dummy\_filename](#input\_dummy\_filename) | Whether to create dummy lambda permissions or not | `string` | `"dummy-file.txt"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A map that defines environment variables for the Lambda Function. | `map(string)` | `{}` | no |
| <a name="input_ephemeral_storage_size"></a> [ephemeral\_storage\_size](#input\_ephemeral\_storage\_size) | A map that defines environment variables for the Lambda Function. | `number` | `512` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Path to zip file | `string` | `""` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | Handler, for example: index.handler | `string` | `"index.handler"` | no |
| <a name="input_ignore_source_code_hash"></a> [ignore\_source\_code\_hash](#input\_ignore\_source\_code\_hash) | Whether to ignore changes to the function's source code hash. Set to true if you manage infrastructure and code deployments separately. | `bool` | `false` | no |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | Lambda name | `string` | `""` | no |
| <a name="input_lambda_role"></a> [lambda\_role](#input\_lambda\_role) | Lambda custom role ARN | `string` | `""` | no |
| <a name="input_layers"></a> [layers](#input\_layers) | List of layer arns | `list(any)` | `[]` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format | `map(string)` | `{}` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Handler, for example: nodejs18.x | `string` | `"nodejs18.x"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to resources. | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Lambda execution time limit in seconds | `number` | `3` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group ids when Lambda Function should run in the VPC. | `list(string)` | `null` | no |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_basic_role_arn"></a> [lambda\_basic\_role\_arn](#output\_lambda\_basic\_role\_arn) | The ARN of the IAM role created for the Lambda Function |
| <a name="output_lambda_basic_role_name"></a> [lambda\_basic\_role\_name](#output\_lambda\_basic\_role\_name) | The name of the IAM role created for the Lambda Function |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | The ARN of the Lambda Function |
| <a name="output_lambda_function_invoke_arn"></a> [lambda\_function\_invoke\_arn](#output\_lambda\_function\_invoke\_arn) | The Invoke ARN of the Lambda Function |
| <a name="output_lambda_function_last_modified"></a> [lambda\_function\_last\_modified](#output\_lambda\_function\_last\_modified) | The date Lambda Function resource was last modified |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | The name of the Lambda Function |
| <a name="output_lambda_function_qualified_arn"></a> [lambda\_function\_qualified\_arn](#output\_lambda\_function\_qualified\_arn) | The ARN identifying your Lambda Function Version |
| <a name="output_lambda_function_qualified_invoke_arn"></a> [lambda\_function\_qualified\_invoke\_arn](#output\_lambda\_function\_qualified\_invoke\_arn) | The Invoke ARN identifying your Lambda Function Version |
| <a name="output_lambda_function_version"></a> [lambda\_function\_version](#output\_lambda\_function\_version) | Latest published version of Lambda Function |
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
}

terraform {
  source = "git::git@github.com:syncsoul/terraform-modules.git//aws/lambda?ref=main"
}

dependency "s3_bucket" {
  config_path                             = "../../s3_buckets/cards"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"]
  mock_outputs = {
    s3_bucket_id  = "mock_name"
    s3_bucket_arn = "arn:aws:s3:::mock"
  }
}

inputs = {
  lambda_name         = "${local.environment}-s3-backend-${local.name}"
  create_default_role = true
  basic_role_name     = "${local.environment}-s3-backend-${local.name}-role"

  create_dummy_lambda     = true
  dummy_filename          = "index.mjs"
  dummy_content           = "console.log('12345678')"
  ignore_source_code_hash = true

  handler = "index.handler"
  runtime = "nodejs18.x"

  environment_variables = {
    S3_BUCKET = dependency.s3_bucket.outputs.s3_bucket_id
  }

  create_custom_policies = true

  # policies = {
  #   S3ReadOnly = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  # }

  custom_policies = {

    s3Access = {
      name        = "${local.environment}-s3Access-syncsoul"
      path        = "/"
      description = "Allow to get files from S3 bucket"
      policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*",
        "s3:Describe*",
        "s3-object-lambda:Get*",
        "s3-object-lambda:List*"
      ],
      "Resource": [
        "${dependency.s3_bucket.outputs.s3_bucket_arn}",
        "${dependency.s3_bucket.outputs.s3_bucket_arn}/*"
      ]
    }
  ]
}
EOF
    }
  }

}
```
