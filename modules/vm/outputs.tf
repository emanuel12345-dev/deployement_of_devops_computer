# modules/vm/outputs.tf
output "vm_id" {
  value = azurerm_windows_virtual_machine.main.id
}

output "public_ip" {
  value = azurerm_public_ip.main.ip_address
}

output "private_ip" {
  value = azurerm_network_interface.main.private_ip_address
}