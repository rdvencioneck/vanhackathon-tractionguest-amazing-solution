variable "network_name" {
  default = "vanhackathon-tractionguest"
}

variable "region" {
  default = "us-central1"
}

variable "databasepwd" {
  default = "P4s_$W0rD9"
}

variable "k8s_clustername" {
  default = "vanhackathon-tractionguest-k8s"
}

resource "google_compute_network" "default" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = "true"
}

resource "google_sql_database_instance" "master" {
  name = "master-instance"
  database_version = "MYSQL_5_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
            ipv4_enabled = "true"
        }
  }
}

resource "google_sql_user" "users" {
  name     = "admin"
  instance = "${google_sql_database_instance.master.name}"
  password = "${var.databasepwd}"
}

resource "google_sql_database" "user_information" {
  name      = "userinfo"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}

resource "google_container_cluster" "gke-cluster" {
  name               = "${var.k8s_clustername}"
  network            = "${var.network_name}"
  region             = "${var.region}"
  initial_node_count = 3
}