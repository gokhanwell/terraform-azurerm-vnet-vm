resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.resource_group.location 
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.vnet_cidr
}
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_cidr
}
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  allocation_method   = var.public_ip_allocation
  tags = {
    Name = var.public_ip_name
  }
}
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  
  ip_configuration {
    name                          = var.nic_ip_conf_name
    subnet_id                    = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.nic_ip_conf_private_ip
    public_ip_address_id         = azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_network_security_group" "security_group" {
  name                = var.security_group_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  dynamic "security_rule" {
    for_each = var.allowed_ports
    content {
      name                       = "allow-${security_rule.value}"
      priority                   = 1000 + security_rule.value
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
resource "azurerm_network_interface_security_group_association" "nic_security_group_association" {
  network_interface_id = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.security_group.id
}