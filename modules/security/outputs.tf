# modules/security/outputs.tf
output "nsg_id" {
  value = azurerm_network_security_group.main.id
}