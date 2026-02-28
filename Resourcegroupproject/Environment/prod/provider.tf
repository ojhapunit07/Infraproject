terraform {
   backend "azurerm" {
     }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "40811e27-06f5-4d2e-8700-914ec325b441"

}

