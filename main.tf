terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate71ac2932"
    container_name       = "tfstate"
    key                  = "core.falkeredet.tfstate"
  }
}

provider "azurerm" {
  version = "=2.0.0"

  features {}
}

resource "azurerm_resource_group" "core_rg" {
  name     = "rg-core"
  location = "West Europe"
}

module "key_vault" {
  source              = "./modules/key-vault"
  name                = "kv-core"
  resource_group_name = azurerm_resource_group.core_rg.name
}