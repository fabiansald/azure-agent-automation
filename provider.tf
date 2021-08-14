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

resource "azurerm_resource_group" "azagent1" {
  name     = var.resgroup
  location = var.milocation
}
