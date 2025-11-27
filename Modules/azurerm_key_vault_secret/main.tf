resource "azurerm_key_vault_secret" "keysecret" {
  for_each     = var.todosecret
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.keyid[each.key].id
}
