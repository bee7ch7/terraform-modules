# aws_ecs_task_definitions

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_task_execution_policies"></a> [task\_execution\_policies](#module\_task\_execution\_policies) | ./iam-policy//. | n/a |
| <a name="module_task_execution_role"></a> [task\_execution\_role](#module\_task\_execution\_role) | ./iam-assumable-role//. | n/a |
| <a name="module_task_policies"></a> [task\_policies](#module\_task\_policies) | ./iam-policy//. | n/a |
| <a name="module_task_role"></a> [task\_role](#module\_task\_role) | ./iam-assumable-role//. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | n/a | `number` | n/a | yes |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | n/a | `string` | n/a | yes |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | n/a | `number` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | n/a | `bool` | `true` | no |
| <a name="input_create_log_group"></a> [create\_log\_group](#input\_create\_log\_group) | n/a | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_log_retantion_period"></a> [log\_retantion\_period](#input\_log\_retantion\_period) | n/a | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | n/a | `string` | `"awsvpc"` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | n/a | `list(any)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_task_create_role"></a> [task\_create\_role](#input\_task\_create\_role) | n/a | `bool` | `false` | no |
| <a name="input_task_custom_role_policy_arns"></a> [task\_custom\_role\_policy\_arns](#input\_task\_custom\_role\_policy\_arns) | n/a | `list(any)` | `[]` | no |
| <a name="input_task_execution_create_role"></a> [task\_execution\_create\_role](#input\_task\_execution\_create\_role) | n/a | `bool` | `false` | no |
| <a name="input_task_execution_custom_role_policy_arns"></a> [task\_execution\_custom\_role\_policy\_arns](#input\_task\_execution\_custom\_role\_policy\_arns) | n/a | `list(any)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"<br>]</pre> | no |
| <a name="input_task_execution_policies"></a> [task\_execution\_policies](#input\_task\_execution\_policies) | n/a | `map(any)` | `{}` | no |
| <a name="input_task_execution_policies_create"></a> [task\_execution\_policies\_create](#input\_task\_execution\_policies\_create) | n/a | `bool` | `false` | no |
| <a name="input_task_execution_role_name"></a> [task\_execution\_role\_name](#input\_task\_execution\_role\_name) | n/a | `string` | `""` | no |
| <a name="input_task_execution_role_requires_mfa"></a> [task\_execution\_role\_requires\_mfa](#input\_task\_execution\_role\_requires\_mfa) | n/a | `bool` | `false` | no |
| <a name="input_task_execution_trusted_role_services"></a> [task\_execution\_trusted\_role\_services](#input\_task\_execution\_trusted\_role\_services) | n/a | `list(any)` | <pre>[<br>  "ecs-tasks.amazonaws.com"<br>]</pre> | no |
| <a name="input_task_policies"></a> [task\_policies](#input\_task\_policies) | n/a | `map(any)` | `{}` | no |
| <a name="input_task_policies_create"></a> [task\_policies\_create](#input\_task\_policies\_create) | n/a | `bool` | `false` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_task_role_name"></a> [task\_role\_name](#input\_task\_role\_name) | ### task #### | `string` | `""` | no |
| <a name="input_task_role_requires_mfa"></a> [task\_role\_requires\_mfa](#input\_task\_role\_requires\_mfa) | n/a | `bool` | `false` | no |
| <a name="input_task_trusted_role_services"></a> [task\_trusted\_role\_services](#input\_task\_trusted\_role\_services) | n/a | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ecs_task_definition_arn"></a> [aws\_ecs\_task\_definition\_arn](#output\_aws\_ecs\_task\_definition\_arn) | n/a |
| <a name="output_aws_ecs_task_definition_log_group"></a> [aws\_ecs\_task\_definition\_log\_group](#output\_aws\_ecs\_task\_definition\_log\_group) | n/a |
| <a name="output_task_execution_iam_role_arn"></a> [task\_execution\_iam\_role\_arn](#output\_task\_execution\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_task_execution_policies"></a> [task\_execution\_policies](#output\_task\_execution\_policies) | n/a |
| <a name="output_task_iam_role_arn"></a> [task\_iam\_role\_arn](#output\_task\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_task_policies"></a> [task\_policies](#output\_task\_policies) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
