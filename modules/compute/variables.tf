variable "environment" {
  description = "The environment name"
  type        = string
}

variable "location" {
  description = "The location for resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "nsg_id" {
  description = "The ID of the Network Security Group"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the VM"
  type        = string
}
