<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | the name of your environment, e.g. "prod" | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of repository | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Policy | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ecr_repository_url"></a> [aws\_ecr\_repository\_url](#output\_aws\_ecr\_repository\_url) | n/a |
<!-- END_TF_DOCS -->
