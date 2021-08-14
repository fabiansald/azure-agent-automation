# VNETs

resource "azurerm_virtual_network" "vnetazagent1" {
  name                = "vnetazagent1"
  resource_group_name = azurerm_resource_group.azagent1.name
  location            = azurerm_resource_group.azagent1.location
  address_space       = ["192.168.0.0/16"]

  tags = {
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }

  depends_on = [azurerm_resource_group.azagent1]
}

resource "azurerm_subnet" "azagent1sn1" {
  name                 = "azagent1sn1"
  resource_group_name  = azurerm_resource_group.azagent1.name
  address_prefixes     = ["192.168.77.0/25"]
  virtual_network_name = azurerm_virtual_network.vnetazagent1.name
}

resource "azurerm_network_interface_security_group_association" "sgazagent1nic" {
  network_interface_id      = azurerm_network_interface.azagent1nic1.id
  network_security_group_id = azurerm_network_security_group.azagent1nsg1.id
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
