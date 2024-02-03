<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `any` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Map with parameter settings | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_parameter_arns"></a> [ssm\_parameter\_arns](#output\_ssm\_parameter\_arns) | n/a |
| <a name="output_ssm_parameter_values"></a> [ssm\_parameter\_values](#output\_ssm\_parameter\_values) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Map with parameter settings | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resource | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_parameter_arns"></a> [ssm\_parameter\_arns](#output\_ssm\_parameter\_arns) | List of SSM parameter arns |
| <a name="output_ssm_parameter_values"></a> [ssm\_parameter\_values](#output\_ssm\_parameter\_values) | List of SSM parameter values |
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

  facebook_client_id = get_env("FACEBOOK_CLIENT_ID")
  facebook_client_secret = get_env("FACEBOOK_CLIENT_SECRET")
}

terraform {
  source = "git::git@github.com:syncsoul/terraform-modules.git//aws/aws_ssm_ps?ref=main"
}

inputs = {

  parameters = {
    facebook_client_id = {
      name = "/${local.environment}/${local.name}/facebook/auth/client_id"
      value = local.facebook_client_id
    }
    facebook_client_secret = {
      name = "/${local.environment}/${local.name}/facebook/auth/client_secret"
      value = local.facebook_client_secret
    }
  }

}
```
