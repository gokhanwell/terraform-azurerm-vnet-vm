variable "subscription_id" {
    type = string
    description = "your subscription id"
}
variable "rg_name" {
    type = string
    description = "resource_group name"
}
variable "rg_location" {
    type = string
    description = "resource_group location"
}
variable "vnet_name" {
    type = string
    description = "vnet name"
    default = "terraform-vnet"
}
variable "vnet_cidr" {
    type = list
    description = "vnet cidr block"
    default = ["10.0.0.0/16"]
}
variable "subnet_name" {
    type = string
    description = "subnet name"
    default = "terraform-subnet"
}
variable "subnet_cidr" {
    type = list
    description = "subnet cidr block"
    default = ["10.0.1.0/24"]
}
variable "nic_name" {
    type = string
    description = "network interface name"
    default = "terraform-nic"
}
variable "nic_ip_conf_name" {
    type = string
    description = "network interface ip configuration name"
    default = "internal"
}
variable "nic_ip_conf_private_ip" {
    type = string
    description = "network interface ip configuration private ip address allocation"
    default = "Dynamic"
}
variable "public_ip_name" {
    type = string
    description = "public ip name"
    default = "terraform-public-ip"
}
variable "public_ip_allocation" {
    type = string
    description = "public ip allocation method"
    default = "Static"
}
variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
  default = [22, 80, 443]
}
variable "security_group_name" {
    type = string
    description = "security group name"
    default = "terraform-sec-grp"
}
variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default = "terraform-vm"
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