# Landing Zone for Azure

resource "azurerm_network_security_group" "azagentnsg" {
  name                = "azagentnsg"
  resource_group_name = azurerm_resource_group.azagentrg.name
  location            = azurerm_resource_group.azagentrg.location

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
