variable "helm_version" {
  default = "v2.9.1"
}

provider "helm" {
  tiller_image = "gcr.io/kubernetes-helm/tiller:${var.helm_version}"

  kubernetes {
    host                   = "${google_container_cluster.gke-cluster.endpoint}"
    token                  = "${data.google_client_config.current.access_token}"
    client_certificate     = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_certificate)}"
    client_key             = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_key)}"
    cluster_ca_certificate = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.cluster_ca_certificate)}"
  }
}

resource "google_compute_address" "jenkins" {
  name   = "${var.k8s_clustername}-jenkins"
  region = "${var.region}"
}

resource "helm_release" "jenkins" {
  name  = "jenkins"
  chart = "stable/jenkins"

  values = [<<EOF
Master:
  AdminUser: admin
  AdminPassword: "${var.databasepwd}"
rbac:
  create: false
Persistence:
  Enabled: false
EOF
  ]
}