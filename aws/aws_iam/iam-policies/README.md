# iam-policies

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policies"></a> [policies](#input\_policies) | Description | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_list_of_policy_arns"></a> [list\_of\_policy\_arns](#output\_list\_of\_policy\_arns) | Description |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | Description |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | Description |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | Description |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
