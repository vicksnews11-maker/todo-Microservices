variable "todosecret" {
  type = map(object({
    key_vault_name      = string
    resource_group_name = string
    name                = string
    value               = string
  }))
}
