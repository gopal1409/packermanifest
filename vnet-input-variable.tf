#virtual network subnet and subnet nsg
#virtual network
variable "vnet_name" {
  type= string
  default = "vnet-default"
}
variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
#web subnet
variable "web_subnet_name" {
  type = string
  default = "websubnet"
}

variable "web_subnet_address" {
  type = list(string)
  default = ["10.0.1.0/24"]
}
#app_subnet
variable "app_subnet_name" {
  type = string
  default = "appsubnet"
}

variable "app_subnet_address" {
  type = list(string)
  default = ["10.0.11.0/24"]
}
#db_subnet
variable "db_subnet_name" {
  type = string
  default = "dbsubnet"
}

variable "db_subnet_address" {
  type = list(string)
  default = ["10.0.21.0/24"]
}
#baston_subnet
variable "bastion_subnet_name" {
  type = string
  default = "dbsubnet"
}

variable "bastion_subnet_address" {
  type = list(string)
  default = ["10.0.21.0/24"]
}