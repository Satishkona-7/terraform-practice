# resource "azurerm_resource_group" "rg" {
#   name     = var.name
#   location = var.location
# }
data "azurerm_resource_group" "rg" {
  name = "test"
}
resource "azurerm_virtual_network" "vnet" {
  name = var.v_net_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  address_space = [ "10.0.0.0/16" ]
}

resource "azurerm_subnet" "subnet" {
  name = var.subnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [ "10.0.1.0/24" ]
}
resource "azurerm_subnet" "newsubnet" {
  name = "vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.2.0/24"]
}