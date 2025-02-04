# endpoints

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_sagemaker_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_endpoint) | resource |
| [aws_sagemaker_endpoint_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_endpoint_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_endpoint"></a> [create\_endpoint](#input\_create\_endpoint) | Create endpoint resource or not | `bool` | `true` | no |
| <a name="input_create_endpoint_configuration"></a> [create\_endpoint\_configuration](#input\_create\_endpoint\_configuration) | Create endpoint configuration resource or not | `bool` | `true` | no |
| <a name="input_endpoint_config_name"></a> [endpoint\_config\_name](#input\_endpoint\_config\_name) | Endpoint config name | `string` | `""` | no |
| <a name="input_endpoint_name"></a> [endpoint\_name](#input\_endpoint\_name) | Endpoint name | `string` | `""` | no |
| <a name="input_production_variants"></a> [production\_variants](#input\_production\_variants) | Production variats specification | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_arn"></a> [endpoint\_arn](#output\_endpoint\_arn) | Endpoint ARN |
| <a name="output_endpoint_configuration_arn"></a> [endpoint\_configuration\_arn](#output\_endpoint\_configuration\_arn) | Endpoint configuration ARN |
| <a name="output_endpoint_configuration_name"></a> [endpoint\_configuration\_name](#output\_endpoint\_configuration\_name) | Endpoint configuration name |
| <a name="output_endpoint_name"></a> [endpoint\_name](#output\_endpoint\_name) | Endpoint name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
