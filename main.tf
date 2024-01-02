resource "kubernetes_namespace" "terraform_minikube" {
  metadata {
    name = var.namespace_name[0]
  }
}

resource "kubernetes_deployment" "terraform_minikube" {
  metadata {
    name = var.deployment_name[0]
    labels = {
      label = var.labels[0]
    }
    namespace = var.namespace_name[0]
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        label = var.labels[0]
      }
    }

    template {
      metadata {
        labels = {
          label = var.labels[0]
        }
      }

      spec {
        container {
          name = var.container_name[0]
          image = "nginx:1.21.6"

          resources {
            limits = {
              cpu = "5m"
              memory = "128Mi"
            }
            requests = {
              cpu = "1m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}