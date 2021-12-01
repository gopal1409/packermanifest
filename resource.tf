resource "azurerm_resource_group" "demoresourcegrp"{
    location = var.resource_group_location
    name = var.resource_group_name
}
#random string
resource "random_string" "myrandom" {
  length = 16
  upper = false
  special = false
}

#resource azure storage account
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.demoresourcegrp.name
  location                 = azurerm_resource_group.demoresourcegrp.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  #account_encryption_source = "Microsoft.Storage"

  tags = {
    environment = "staging"
  }
}