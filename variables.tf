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

variable "github_username" {
  description = "Github username"
  type = string
  default = ""
}

variable "github_token" {
  description = "Github token"
  type = string
  default = ""
}

variable "service_port" {
  description = "Service port"
  type = number
  default = 80
}

variable "container_port" {
  description = "Container port"
  type = number
  default = 80
}

variable "node_port" {
  description = "Node port"
  type = number
  default = 30000
}