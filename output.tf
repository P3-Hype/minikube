output "service_node_port" {
  value = kubernetes_service.terraform_minikube_service.spec[0].port[0].node_port
}