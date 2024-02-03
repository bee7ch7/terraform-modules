# resource "aws_api_gateway_resource" "this" {
#   count = var.create_resources ? length(var.resources) : 0

#   rest_api_id = var.api_id
#   parent_id   = var.parent_id
#   path_part   = var.resources[count.index]
# }

resource "aws_api_gateway_resource" "this" {
  for_each = { for k, v in var.resources : k => v if var.create_resources }

  rest_api_id = var.api_id
  parent_id   = strcontains(var.parent_id, "/") ? data.aws_api_gateway_resource.this[each.key].id : var.parent_id
  path_part   = each.value
}

data "aws_api_gateway_resource" "this" {
  for_each = { for k, v in var.resources : k => v if strcontains(var.parent_id, "/") }

  rest_api_id = var.api_id
  path        = var.parent_id

}
