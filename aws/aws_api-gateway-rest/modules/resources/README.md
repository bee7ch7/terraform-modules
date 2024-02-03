# resources

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
| [aws_api_gateway_resource.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_resource.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/api_gateway_resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | description | `string` | n/a | yes |
| <a name="input_create_resources"></a> [create\_resources](#input\_create\_resources) | description | `bool` | `true` | no |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | description | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | description | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources"></a> [resources](#output\_resources) | description |
| <a name="output_resources_map"></a> [resources\_map](#output\_resources\_map) | description |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
