# sns

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.31 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Create resource or not | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | SNS topic name | `string` | `"default-sns"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | SNS topic protocol | `string` | `"email"` | no |
| <a name="input_subscribers"></a> [subscribers](#input\_subscribers) | Subscribers map | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_arn"></a> [sns\_arn](#output\_sns\_arn) | SNS topic arn |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
