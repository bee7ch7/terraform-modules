# models

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.30 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_execution_role"></a> [execution\_role](#module\_execution\_role) | ../iam-assumable-role//. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_sagemaker_model.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_model) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_model"></a> [create\_model](#input\_create\_model) | Create model resource or not | `bool` | `true` | no |
| <a name="input_enable_network_isolation"></a> [enable\_network\_isolation](#input\_enable\_network\_isolation) | Enable network isolation | `bool` | `false` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | Model executiob role ARN | `string` | `null` | no |
| <a name="input_model_tags"></a> [model\_tags](#input\_model\_tags) | Model tags | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Model name | `string` | `""` | no |
| <a name="input_policies_arns"></a> [policies\_arns](#input\_policies\_arns) | Map of policies ARNs | `map(string)` | `{}` | no |
| <a name="input_primary_container"></a> [primary\_container](#input\_primary\_container) | Primary container specification | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | `{}` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | List of trusted services | `list(any)` | <pre>[<br>  "sagemaker.amazonaws.com"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_model_arn"></a> [model\_arn](#output\_model\_arn) | Model ARN |
| <a name="output_model_execution_role_arn"></a> [model\_execution\_role\_arn](#output\_model\_execution\_role\_arn) | Model ARN |
| <a name="output_model_execution_role_name"></a> [model\_execution\_role\_name](#output\_model\_execution\_role\_name) | Model ARN |
| <a name="output_model_name"></a> [model\_name](#output\_model\_name) | Model ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
