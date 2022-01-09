variable "resource_group_names" {
  type    = list(string)
  default = []
}

variable "environment_name" {
  type    = string
  default = ""
}

variable "aks_kubernetes_version" {
  type = string
}

variable "aks_node_count" {
  type = number
}

variable "aks_node_pool_name" {
  type = string
}
