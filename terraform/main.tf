resource "kubernetes_config_map" "hi" {
  metadata {
    name = "hi"
  }

  data = {
    NAME = "dear people from Yolt"
  }
}

resource "kubernetes_deployment" "hi" {
  metadata {
    name = "hi"
    labels = {
      app = "hi"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hi"
      }
    }

    template {
      metadata {
        labels = {
          app = "hi"
        }
      }

      spec {
        container {
          image = "ffung/hi"
          image_pull_policy = "Always"
          name  = "hi"

          env_from {
            config_map_ref {
              name = kubernetes_config_map.hi.metadata.0.name
            }
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 5000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hi" {
  metadata {
    name = "hi"
  }
  spec {
    selector = {
      app = "${kubernetes_deployment.hi.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 5000
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}
