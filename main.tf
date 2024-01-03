resource "kubernetes_namespace" "terraform_minikube" {
  metadata {
    name = var.namespace_name[0]
  }
}

resource "kubernetes_service" "terraform_minikube_service" {
  metadata {
    name = "${var.deployment_name[0]}-service"
    namespace = kubernetes_namespace.terraform_minikube.metadata[0].name
  }

  spec {
    selector = {
      label = var.labels[0]
    }

    port {
      port        = var.service_port
      target_port = var.container_port
      node_port   = var.node_port 
    }

    type = "NodePort"
  }
}

resource "kubernetes_secret" "ghcr_credentials" {
  metadata {
    name = "ghcr-credentials"
    namespace = kubernetes_namespace.terraform_minikube.metadata[0].name
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      "auths" = {
        "ghcr.io" = {
          "username" = var.github_username
          "password" = var.github_token
          "auth"     = base64encode("${var.github_username}:${var.github_token}")
        }
      }
    })
  }
  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_deployment" "terraform_minikube" {
  metadata {
    name      = var.deployment_name[0]
    labels    = { label = var.labels[0] }
    namespace = var.namespace_name[0]
  }

  spec {
    replicas = 1

    selector {
      match_labels = { label = var.labels[0] }
    }

    template {
      metadata {
        labels = { label = var.labels[0] }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret.ghcr_credentials.metadata[0].name
        }
        container {
          name  = var.container_name[0]
          image = "nginx:1.14.2"
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}
