variable "rg_name" {
    type = string
    description = "resource_group name"
    nullable    = false
}
variable "rg_location" {
    type = string
    description = "resource_group location"
    nullable    = false
}
variable "vnet_name" {
    type = string
    description = "vnet name"
    nullable    = false
}
variable "vnet_cidr" {
    type = list
    description = "vnet cidr block"
}
variable "subnet_name" {
    type = string
    description = "subnet name"
}
variable "subnet_cidr" {
    type = list
    description = "subnet cidr block"
}
variable "nic_name" {
    type = string
    description = "network interface name"
}
variable "nic_ip_conf_name" {
    type = string
    description = "network interface ip configuration name"
}
variable "nic_ip_conf_private_ip" {
    type = string
    description = "network interface ip configuration private ip address allocation"
}
variable "public_ip_name" {
    type = string
    description = "public ip name"
}
variable "public_ip_allocation" {
    type = string
    description = "public ip allocation method"
}
variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
}
variable "security_group_name" {
    type = string
    description = "security group name"
}
variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}
variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}
variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
}
variable "admin_password" {
  description = "Admin password for the Virtual Machine"
  type        = string
  sensitive   = true
}
variable "custom_data" {
  description = "Custom data (Cloud-init or bash script)"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags for the Virtual Machine"
  type        = map(string)
  default     = {}
}
