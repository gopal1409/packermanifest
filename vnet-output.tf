#v net name which is being created for me
output "virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.vnet.name
}
output "virtual_network_id" {
  description = "Virtual Network id"
  value = azurerm_virtual_network.vnet.id
}

output "web_subnet_name" {
  description = "web subnet name"
  value = azurerm_subnet.websubnet.name 
}

output "web_subnet_nsg_name" {
  description = "web subnet nsg name"
  value = azurerm_network_security_group.web_subnet_nsg.name 
}
