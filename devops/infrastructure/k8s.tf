provider "kubernetes" {
  host                   = "${google_container_cluster.gke-cluster.endpoint}"
  token                  = "${data.google_client_config.current.access_token}"
  client_certificate     = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_certificate)}"
  client_key             = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.cluster_ca_certificate)}"
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "production"
  }
}

resource "google_compute_address" "default" {
  name   = "${var.network_name}"
  region = "${var.region}"
}

# vhast = VanHackathon Amazing Solution for Traction
resource "kubernetes_service" "vhast" {
  metadata {
    namespace = "${kubernetes_namespace.prod.metadata.0.name}"
    name      = "vhast"
  }

  spec {
    selector {
      run = "vhast"
    }

    session_affinity = "ClientIP"

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }

    type             = "LoadBalancer"
    load_balancer_ip = "${google_compute_address.default.address}"
  }
}

resource "kubernetes_replication_controller" "vhast" {
  metadata {
    name      = "vhast"
    namespace = "${kubernetes_namespace.prod.metadata.0.name}"

    labels {
      run = "vhast"
    }
  }

  spec {
    selector {
      run = "vhast"
    }

    template {
      container {
        image = "nginx:latest"
        name  = "vhast"
      }
    }
  }
}

output "load-balancer-ip" {
  value = "${google_compute_address.default.address}"
}