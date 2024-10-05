terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = "044e891f-d925-4ac5-b5b7-dfec1f645a88"
}