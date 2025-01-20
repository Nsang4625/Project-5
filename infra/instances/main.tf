
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.47.0"
    }
  }
}


data "digitalocean_ssh_key" "main" {
  name = "nsang"
}

resource "digitalocean_droplet" "main" {
  count = 2
  name = count.index == 0 ? "ci-server" : "registry"
  image = "ubuntu-20-04-x64"
  region = var.region
  size = "s-2vcpu-4gb"
  vpc_uuid = var.vpc_id
  ssh_keys = [
    data.digitalocean_ssh_key.main.id
  ]
}