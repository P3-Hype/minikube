variable "config_path" {
  description = "Path to kubernetes config"
  type = string
  default = "~/.kube/configs/minikube-terraform"
}

variable "config_context" {
  description = "Context for k8s automation"
  type = string
  default = "minikube"
}

variable "namespace_name" {
  description = "Namespace name"
  type = list(string)
  default = []
}

variable "labels" {
  description = "Labels"
  type = list(string)
  default = []
}

variable "deployment_name" {
  description = "Name for deployment"
  type = list(string)
  default = []
}

variable "container_name" {
  description = "Name for the container"
  type = list(string)
  default = []
}