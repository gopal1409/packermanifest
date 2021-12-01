#it will create an virtual network.
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet-1"
  location            = azurerm_resource_group.demoresourcegrp.location
  resource_group_name = azurerm_resource_group.demoresourcegrp.name
  address_space = ["10.0.0.0/16"]
  tags = {
    environment = "staging-vnet"
  }
}
#it will create a subnet
resource "azurerm_subnet" "mysubnet" {
  name = "mysubnet-1"
  resource_group_name = azurerm_resource_group.demoresourcegrp.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes = [ "10.0.2.0/24" ]
}

#we will create a public ip
resource "azurerm_public_ip" "mypublicip" {
    name = "mypublicip-1"
    location            = azurerm_resource_group.demoresourcegrp.location
    resource_group_name = azurerm_resource_group.demoresourcegrp.name
    allocation_method = "Static"
    tags = {
    environment = "staging-publiip"
  } 
}
#create a network interface
resource "azurerm_network_interface" "myvmnic" {
  name = "vmnic"
  location            = azurerm_resource_group.demoresourcegrp.location
  resource_group_name = azurerm_resource_group.demoresourcegrp.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}