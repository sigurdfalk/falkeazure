variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

terraform {
  required_version = "~>0.12"

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate71ac2932"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  version         = "=2.0.0"
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  features {}
}

module "resource-group" {
  source = "./modules/resource-group"
}