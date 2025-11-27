# Resource Groups
module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  todorg = var.todorg
}
#Key_vault
module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_key_vault"
  todokey    = var.todokey
}
#Key_vault_secret
module "azurerm_key_vault_secret" {
  depends_on = [module.azurerm_resource_group, module.azurerm_key_vault]
  source     = "../../Modules/azurerm_key_vault_secret"
  todosecret = var.todosecret
}
#Container Registry
module "azurerm_container_registry" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_container_registry"
  todoacrs   = var.todoacrs
}
#mssql_server
module "azurerm_mssql_server" {
  depends_on  = [module.azurerm_resource_group, module.azurerm_key_vault, module.azurerm_key_vault_secret]
  source      = "../../Modules/azurerm_mssql_server"
  todoservers = var.todoservers
}
#mssql_database
module "azurerm_mssql_database" {
  depends_on = [module.azurerm_resource_group, module.azurerm_mssql_server]
  source     = "../../Modules/azurerm_mssql_database"
  tododb     = var.tododb
}
#Kubernetes_cluster
module "azurerm_kubernetes_cluster" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_kubernetes_cluster"
  todoaks    = var.todoaks
}
