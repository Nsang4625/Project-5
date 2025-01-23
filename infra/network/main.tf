# create a digitalocean vpc for me

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.47.0"
    }
  }
}


resource "digitalocean_vpc" "main" {
  name     = "devops-620-vpc"
  region   = var.region
  ip_range = "10.10.0.0/20"
}

data "digitalocean_domain" "main" {
  name = "cloudemon.me"
}

resource "digitalocean_record" "name" {
  domain = data.digitalocean_domain.main.id
  type   = "A"
  name   = "api"
  value = "157.230.192.136"
}

resource "digitalocean_record" "argocd" {
  domain = data.digitalocean_domain.main.id
  type   = "A"
  name   = "argo"
  value = "157.230.192.136"
}