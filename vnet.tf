# VNETs

resource "azurerm_virtual_network" "vnetazagents" {
  name                = "vnetazagents"
  resource_group_name = azurerm_resource_group.azagentrg.name
  location            = azurerm_resource_group.azagentrg.location
  address_space       = ["192.168.0.0/16"]

  tags = {
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }

  depends_on = [azurerm_resource_group.azagentrg]
}

resource "azurerm_subnet" "azagentsn" {
  name                 = "azagentsn"
  resource_group_name  = azurerm_resource_group.azagentrg.name
  address_prefixes     = ["192.168.77.0/25"]
  virtual_network_name = azurerm_virtual_network.vnetazagents.name
}

resource "azurerm_network_interface_security_group_association" "sgazagentnic" {
  network_interface_id      = azurerm_network_interface.azagentnic.id
  network_security_group_id = azurerm_network_security_group.azagentnsg.id
}

# NAT GATEWAY

# resource "azurerm_nat_gateway" "azagent1-gw1" {
#  name                = "azagent1-gw1"
#  location            = azurerm_resource_group.azagent1.location
#  resource_group_name = azurerm_resource_group.azagent1.name
#  tags = {
#    org = "PS_Azure_Practice"
#appid-or-sso = "fabi8483"  }
#  }
#}
