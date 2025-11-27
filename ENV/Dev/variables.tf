# Resource Groups
variable "todorg" {
  type = map(object({
    name     = string
    location = string
  }))
}
#Key_vault
variable "todokey" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku_name            = string
  }))
}
#Key_vault_secret
variable "todosecret" {
  type = map(object({
    key_vault_name      = string
    resource_group_name = string
    name                = string
    value               = string
  }))
}
#Container Registry
variable "todoacrs" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

    georeplications = list(object({
      location                = string
      zone_redundancy_enabled = optional(bool)
      tags                    = optional(map(string))
    }))
  }))
}
#mssql_server
variable "todoservers" {
  type = map(object({
    kv_name                      = string
    secret_name                  = string
    secret_password              = string
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)
    tags                         = optional(map(string))
    azuread_administrator = optional(list(object({
      login_username = string
      object_id      = string
    })))
  }))
}
#mssql_database
variable "tododb" {
  type = map(object({
    server_name         = string
    resource_group_name = string
    name                = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    tags                = optional(map(string))
  }))
}
#Kubernetes_cluster
variable "todoaks" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    default_node_pool = list(object({
      name       = string
      node_count = number
      vm_size    = string
    }))
    identity = list(object({
      type = string
    }))
  }))
}
