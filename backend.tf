terraform {
  backend "azurerm" {
    storage_account_name = "azsacctfstates"
    container_name       = "azconttfstates"
    key                  = "azagent1.tfstate"
    resource_group_name  = "azpipelineststate"
  }
}

