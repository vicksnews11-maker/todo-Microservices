# Resource Groups
todorg = {
  rg1 = {
    name     = "todo-rg"
    location = "east US"
  }
}
#Key_vault
todokey = {
  key = {
    name                = "todokey1"
    resource_group_name = "todo-rg"
    location            = "east US"
    sku_name            = "standard"
  }
}
#Key_vault_secret
todosecret = {
  secret1 = {
    key_vault_name      = "todo-secretkey"
    resource_group_name = "todo-rg"
    name                = "sql-admin-user"
    value               = "todoadmin"
  }
  secret2 = {
    key_vault_name      = "todo-secretkey"
    resource_group_name = "todo-rg"
    name                = "sql-admin-password"
    value               = "todoapp@12345"
  }
}
#Container Registry
todoacrs = {
  todoacr1 = {
    name                = "todoacr"
    resource_group_name = "todo-rg"
    location            = "east US"
    sku                 = "Premium"
    admin_enabled       = false
    georeplications = [
      {
        location                = "North Europe"
        zone_redundancy_enabled = true
        tags                    = {}
      }
    ]
  }
}
#mssql_server
todoservers = {
  server1 = {
    name                = "todoserver"
    location            = "east US"
    resource_group_name = "todo-rg"
    kv_name             = "todo-key"
    secret_name         = "sql-admin-user"
    secret_password     = "sql-admin-password"
    version             = "12.0"
  }
}
#mssql_database
tododb = {
  db1 = {
    name                = "anjalidb121"
    server_name         = "server123anji"
    resource_group_name = "rg-anjali"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
}
#Kubernetes_cluster
todoaks = {
  todoaks1 = {
    name                = "todoaks-1"
    resource_group_name = "todo-rg"
    location            = "east US"
    dns_prefix          = "dns1"
    default_node_pool = [{
      name       = "default"
      node_count = 1
      vm_size    = "Standard_A2_v2"
    }]
    identity = [{
      type = "SystemAssigned"
    }]
  }
}

