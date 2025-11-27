terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgtodo"
    storage_account_name = "todostrg"
    container_name       = "todocont"
    key                  = "todo.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
}
