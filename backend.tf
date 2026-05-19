terraform {
  backend "azurerm" {
    resource_group_name  = "test"
    storage_account_name = "terraformsa56"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}