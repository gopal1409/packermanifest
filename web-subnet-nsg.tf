#this block will create an websubnet
resource "azurerm_subnet" "websubnet" {
  name = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name = azurerm_resource_group.demoresourcegrp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.web_subnet_address
}
#this block will create an network security group
resource "azurerm_network_security_group" "web_subnet_nsg" {
    name = "${azurerm_subnet.websubnet.name}-nsg"
    location            = azurerm_resource_group.demoresourcegrp.location
    resource_group_name = azurerm_resource_group.demoresourcegrp.name
}
#in this block we will attach the network secureity group with my subnet
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
    # i need to attach nsg rule with my subnet
  depends_on = [
    azurerm_network_security_rule.web_nsg_rule_inbound
  ]
  subnet_id = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id 
}
#local block for security rule
locals {
web_inbound_port_map = {
  "100" : "80"
  "110" : "443"
  "120" : "22"
 }
}

resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each = local.web_inbound_port_map
  name                        = "Rule-Port-${each.value}" #Rule-Port-80
  priority                    = each.key #100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value #80
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.demoresourcegrp.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}
