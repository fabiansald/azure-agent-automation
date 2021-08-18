# Virtual Machines

## Azure Agent for ADO

resource "azurerm_public_ip" "azagent1pip" {
  name                = "azagent1pip"
  resource_group_name = azurerm_resource_group.azagent1.name
  location            = azurerm_resource_group.azagent1.location
  allocation_method   = "Dynamic"

  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

resource "azurerm_network_interface" "azagent1nic1" {
  name                = "azagent1nic1"
  location            = azurerm_resource_group.azagent1.location
  resource_group_name = azurerm_resource_group.azagent1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azagent1sn1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.azagent1pip.id
  }
  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

resource "azurerm_linux_virtual_machine" "azagent1" {
  name                = "azagent1"
  resource_group_name = azurerm_resource_group.azagent1.name
  location            = azurerm_resource_group.azagent1.location
  size                = "Standard_A4_v2"
  admin_username      = var.user
  network_interface_ids = [
    azurerm_network_interface.azagent1nic1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  admin_ssh_key {
    username   = var.user
    public_key = file("~/fabs.pub")
  }

  source_image_reference {
    publisher = var.ubuntu.publisher
    offer     = var.ubuntu.offer
    sku       = var.ubuntu.sku
    version   = var.ubuntu.version
  }

  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

