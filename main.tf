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

resource "azurerm_resource_group" "aci" {
  name     = "rg-aci"
  location = "West Europe"
}