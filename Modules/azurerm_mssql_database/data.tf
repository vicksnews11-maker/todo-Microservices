data "azurerm_mssql_server" "serverid" {
  for_each            = var.tododb
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

