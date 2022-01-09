resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.environment_name}-${azurerm_resource_group.simple_resource_group.location}"
  location            = azurerm_resource_group.simple_resource_group.location
  resource_group_name = azurerm_resource_group.simple_resource_group.name
  dns_prefix          = "aks-${var.environment_name}-001"
  kubernetes_version  = var.aks_kubernetes_version

  default_node_pool {
    name                = var.aks_node_pool_name
    node_count          = var.aks_node_count
    vm_size             = "Standard_D2_v2"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment_name
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw

  sensitive = true
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_fqnd" {
  value = azurerm_kubernetes_cluster.aks_cluster.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}