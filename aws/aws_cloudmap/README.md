# aws_cloudmap

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
| [aws_service_discovery_private_dns_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_service_discovery_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_dns_namespace"></a> [create\_private\_dns\_namespace](#input\_create\_private\_dns\_namespace) | Whether to create private dns namespace | `bool` | `true` | no |
| <a name="input_create_service_discovery_sevices"></a> [create\_service\_discovery\_sevices](#input\_create\_service\_discovery\_sevices) | Whether to create services for private dns namespace | `bool` | `true` | no |
| <a name="input_private_dns_namespace_description"></a> [private\_dns\_namespace\_description](#input\_private\_dns\_namespace\_description) | Namespace description | `string` | `"Description"` | no |
| <a name="input_private_dns_namespace_name"></a> [private\_dns\_namespace\_name](#input\_private\_dns\_namespace\_name) | Namespace name | `string` | `"app.internal"` | no |
| <a name="input_service_discovery_sevices"></a> [service\_discovery\_sevices](#input\_service\_discovery\_sevices) | Map with service configuration | <pre>map(object({<br>    dns_config = object({<br>      routing_policy = optional(string, "MULTIVALUE")<br>      dns_ttl        = number<br>      dns_type       = string<br>    })<br><br>    health_check_config = optional(object({<br>      failure_threshold = optional(number, null)<br>      resource_path     = optional(string, null)<br>      type              = optional(string, null)<br>    }), {})<br><br>    health_check_custom_config = optional(object({<br>      failure_threshold = optional(number, null)<br>    }), {})<br><br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resource | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC id | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_namespace_id"></a> [private\_dns\_namespace\_id](#output\_private\_dns\_namespace\_id) | Private DNS namespace ID |
| <a name="output_service_discovery_service_arns"></a> [service\_discovery\_service\_arns](#output\_service\_discovery\_service\_arns) | Private services ARNs |
| <a name="output_service_discovery_service_ids"></a> [service\_discovery\_service\_ids](#output\_service\_discovery\_service\_ids) | Private services IDs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
