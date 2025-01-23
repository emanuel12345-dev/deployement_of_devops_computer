# modules/vm/variables.tf
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "admin_username" {
  description = "Username for the VM admin account"
  type        = string
}

variable "admin_password" {
  description = "Password for the VM admin account"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "ID of the subnet where the VM will be created"
  type        = string
}

variable "nsg_id" {
  description = "ID of the Network Security Group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}