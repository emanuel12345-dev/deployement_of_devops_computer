# modules/network/outputs.tf
output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}