terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.11.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "2765d1c6-42ae-4328-9ed0-6fb92093c18e"
}
