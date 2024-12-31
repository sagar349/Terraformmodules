resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-vnet"
  address_space       = var.vnet_address_space
  location           = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_subnet" "main" {
  count                = length(var.subnet_prefixes)
  name                 = "${var.environment}-subnet-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}
