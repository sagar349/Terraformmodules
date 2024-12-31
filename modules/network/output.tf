output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  description = "IDs of created subnets"
  value       = azurerm_subnet.main[*].id
}
