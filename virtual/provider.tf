terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7ec3efc2-fa15-418e-835b-2d31e34a64f4"
  tenant_id = "18214fea-ff23-439d-992e-3132b7c65f48"
  client_id = "14392ae1-f07c-4be0-a1ef-8bf4b804cd7a"
  client_secret = "Ikg8Q~EasvBPGnn~_.xEQqdZk1rdGAHQnqZ4haB7"
  features {}
}