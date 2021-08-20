# Main Terraform

provider "azurerm" {
  features {}
}

terraform {

  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "azagentrg" {
  name     = var.resgroup
  location = var.milocation

  tags {
    appid-or-sso = "fabi8483"
    Description = "PSBuild Pipeline"
    Environment = "Sandbox"
  }
}

resource "azurerm_management_lock" "azagentrg-lock" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.example.id
  lock_level = "CanNotDelete"
  notes      = "Protect this resource for RAX PS"
}