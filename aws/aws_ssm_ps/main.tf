resource "aws_ssm_parameter" "this" {
  for_each    = { for k, v in var.parameters : k => v }
  name        = each.value.name
  description = try(each.value.description, "")
  type        = try(each.value.type, "SecureString")
  value       = try(each.value.random, false) ? random_password.this[each.key].result : try(each.value.value, "dummy")
  key_id      = try(each.value.key_id, null)

  tags = var.tags
}

resource "random_password" "this" {
  for_each         = { for k, v in var.parameters : k => v if try(v.random, false) }
  length           = 16
  numeric          = true
  upper            = true
  lower            = true
  special          = true
  override_special = "!#&*"
}
