# main.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
  
  resource_group_name = var.resource_group_name
  location           = var.location
  tags               = var.tags
}

module "network" {
  source = "./modules/network"
  
  resource_group_name = module.resource_group.name
  location           = var.location
  vnet_name          = "${var.project_name}-vnet"
  vnet_address_space = var.vnet_address_space
  subnet_name        = "${var.project_name}-subnet"
  subnet_prefix      = var.subnet_prefix
  tags               = var.tags
}

module "security" {
  source = "./modules/security"
  
  resource_group_name = module.resource_group.name
  location           = var.location
  nsg_name           = "${var.project_name}-nsg"
  tags               = var.tags
}

module "vm" {
  source = "./modules/vm"
  
  resource_group_name  = module.resource_group.name
  location            = var.location
  vm_name             = "${var.project_name}-vm"
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.network.subnet_id
  nsg_id              = module.security.nsg_id
  tags                = var.tags
}


