terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "xxxxxxxx"
  tenant_id = "xxxxxxxxx"
  client_id = "xxxxxx"
  client_secret = "xxxxxx"
  features {}
}
