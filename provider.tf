terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
  required_version = ">= 0.13.0"
}

provider "kubernetes" {
  config_path = pathexpand(var.config_path)
  config_context = var.config_context
}