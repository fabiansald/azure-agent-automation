# Virtual Machines

## Azure Agent for ADO

resource "azurerm_public_ip" "azagentpip" {
  name                = "${var.vmname}pip"
  resource_group_name = azurerm_resource_group.azagentrg.name
  location            = azurerm_resource_group.azagentrg.location
  allocation_method   = "Dynamic"

  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

resource "azurerm_network_interface" "azagentnic" {
  name                = "${var.vmname}nic1"
  location            = azurerm_resource_group.azagentrg.location
  resource_group_name = azurerm_resource_group.azagentrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azagentsn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.azagentpip.id
  }
  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

resource "azurerm_linux_virtual_machine" "azagentvm" {
  name                = var.vmname
  resource_group_name = azurerm_resource_group.azagentrg.name
  location            = azurerm_resource_group.azagentrg.location
  size                = "Standard_A4_v2"
  admin_username      = var.user
  network_interface_ids = [
    azurerm_network_interface.azagentnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  admin_ssh_key {
    username   = var.user
    public_key = file("${var.sshkey[1]}")
  }

  source_image_reference {
    publisher = var.ubuntu.publisher
    offer     = var.ubuntu.offer
    sku       = var.ubuntu.sku
    version   = var.ubuntu.version
  }

  plan {
    name      = var.ubuntu.offer
    publisher = var.ubuntu.publisher
    product   = var.ubuntu.offer
  }

  tags = {
    environment  = "Azure_Pipelines"
    org          = "PS_Azure_Practice"
    appid-or-sso = "fabi8483"
  }
}

