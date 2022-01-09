terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "simple-resource-group" {
  count    = length(var.resource_group_names)
  name     = "simple-resource-group-${var.environment_name}-${var.resource_group_names[count.index]}"
  location = "eastus"
}