# methods

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
| [aws_api_gateway_integration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_integration_response.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration_response) | resource |
| [aws_api_gateway_method.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_response.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_api_gateway_authorizer.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/api_gateway_authorizer) | data source |
| [aws_api_gateway_resource.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/api_gateway_resource) | data source |
| [aws_api_gateway_rest_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/api_gateway_rest_api) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | description | `string` | n/a | yes |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | description | `string` | n/a | yes |
| <a name="input_authorizers"></a> [authorizers](#input\_authorizers) | List of authorizers from data api gateway | `list(string)` | `[]` | no |
| <a name="input_methods"></a> [methods](#input\_methods) | description | `any` | n/a | yes |
| <a name="input_request_validators"></a> [request\_validators](#input\_request\_validators) | Map with request validators | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_integrations"></a> [integrations](#output\_integrations) | description |
| <a name="output_methods"></a> [methods](#output\_methods) | description |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
