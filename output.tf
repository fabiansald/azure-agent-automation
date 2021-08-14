output "public_ip_address" {
  value = azurerm_public_ip.azagent1pip
}

resource "local_file" "myhosts" {
  depends_on = [azurerm_linux_virtual_machine.azagent1, azurerm_public_ip.azagent1pip]
  filename   = "ansible/hosts"
  content    = "[agent]\n${azurerm_public_ip.azagent1pip.ip_address}  ansible_user=centos ansible_ssh_private_key_file=~/fabs"
}
