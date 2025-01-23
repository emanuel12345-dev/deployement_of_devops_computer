# variables.tf
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "devops-tools-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "devops-tools"
}

variable "vnet_address_space" {
  description = "Address space for Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "Address prefix for Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D4s_v3"  # Recommended for Docker Desktop
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "DevOps Tools"
    ManagedBy   = "Terraform"
  }
}