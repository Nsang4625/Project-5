terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.47.0"
    }
  }
}

resource "digitalocean_database_cluster" "main" {
  name       = "mongo-cluster"
  engine     = "mongodb"
  version    = "6"
  size       = "db-s-2vcpu-4gb"
  region     = "sgp1"
  node_count = 1
  private_network_uuid = var.vpc_id
}

resource "digitalocean_database_db" "customer" {
  cluster_id = digitalocean_database_cluster.main.id
  name = "customer"
}

resource "digitalocean_database_db" "product" {
  cluster_id = digitalocean_database_cluster.main.id
  name = "product"
}
resource "digitalocean_database_db" "shopping" {
  cluster_id = digitalocean_database_cluster.main.id
  name = "shopping"
}

resource "digitalocean_database_user" "customer" {
  cluster_id = digitalocean_database_cluster.main.id
  name = "customer"
#   password = "password"
  role = "primary"
}

# resource "digitalocean_database_firewall" "main" {
#   cluster_id = digitalocean_database_cluster.main.id
#   name = "main"
#   rules {
#     type = "k8s"
#   }
# }