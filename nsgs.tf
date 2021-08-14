# Landing Zone for Azure

resource "azurerm_network_security_group" "azagent1nsg1" {
  name                = "azagent1nsg1"
  resource_group_name = azurerm_resource_group.azagent1.name
  location            = azurerm_resource_group.azagent1.location

  security_rule {
    name                       = "SSH"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }

  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}
