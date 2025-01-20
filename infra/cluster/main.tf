
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.47.0"
    }
  }
}

resource "digitalocean_kubernetes_cluster" "main" {
  name   = "devops-620-cluster"
  region = var.region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.31.1-do.5"
  vpc_uuid = var.vpc_id
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}
