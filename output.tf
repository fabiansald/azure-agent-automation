output "public_ip_address" {
  value = azurerm_public_ip.azagentpip
}

resource "local_file" "myhosts" {
  depends_on = [azurerm_linux_virtual_machine.azagentvm, azurerm_public_ip.azagentpip]
  filename   = "ansible/hosts"
  content    = "[agent]\n${azurerm_public_ip.azagentpip.ip_address}  ansible_user=${var.user} ansible_ssh_private_key_file=${var.sshkey[0]}"
}
