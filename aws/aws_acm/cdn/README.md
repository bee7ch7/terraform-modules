# cdn

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | terraform-aws-modules/acm/aws | 4.3.2 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_route53_records"></a> [create\_route53\_records](#input\_create\_route53\_records) | When validation is set to DNS, define whether to create the DNS records internally via Route53 or externally using any DNS provider | `bool` | `true` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name for which the certificate should be issued | `string` | `""` | no |
| <a name="input_root_domain_name"></a> [root\_domain\_name](#input\_root\_domain\_name) | A domain name for which the certificate should be issued | `string` | `null` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | SAN names for the certificate | `list(any)` | `[]` | no |
| <a name="input_wait_for_validation"></a> [wait\_for\_validation](#input\_wait\_for\_validation) | Whether to wait for the validation to complete | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_prime_arn"></a> [acm\_prime\_arn](#output\_acm\_prime\_arn) | ARN of the certificate |
| <a name="output_acm_prime_domain_names"></a> [acm\_prime\_domain\_names](#output\_acm\_prime\_domain\_names) | Primary domain names |
| <a name="output_validation_domains"></a> [validation\_domains](#output\_validation\_domains) | Validation domains |
| <a name="output_validation_route53_record_fqdns"></a> [validation\_route53\_record\_fqdns](#output\_validation\_route53\_record\_fqdns) | Validation records |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
