terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate71ac2932"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  version = "=2.0.0"

  features {}
}

resource "azurerm_resource_group" "falkeazure" {
  name     = "rg-falkeazure"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = "acr-falkeazure"
  resource_group_name = azurerm_resource_group.falkeazure.name
  location            = azurerm_resource_group.falkeazure.location
  sku                 = "Basic"
  admin_enabled       = false
}