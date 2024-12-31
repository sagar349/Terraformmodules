provider "azurerm" {
  features {}
  subscription_id= "e2295a5b-c1a0-4469-bd83-51ab62bc1ab7"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.environment}-rg"
  location = var.location
}

module "network" {
  source = "./modules/network"
  
  environment      = var.environment
  location        = var.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_address_space = var.vnet_address_space
  subnet_prefixes    = var.subnet_prefixes
}

module "security" {
  source = "./modules/security"
  
  environment         = var.environment
  location           = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "compute" {
  source = "./modules/compute"
  
  environment         = var.environment
  location           = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id          = module.network.subnet_ids[0]
  nsg_id             = module.security.nsg_id
  vm_size            = var.vm_size
  admin_username     = var.admin_username
}
