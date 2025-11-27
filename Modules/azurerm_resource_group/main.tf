resource "azurerm_resource_group" "todo-rg" {
  for_each = var.todorg
  name     = each.value.name
  location = each.value.location
}
