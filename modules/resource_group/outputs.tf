# modules/resource_group/outputs.tf
output "name" {
  value = azurerm_resource_group.main.name
}

output "id" {
  value = azurerm_resource_group.main.id
}
