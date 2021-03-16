terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.6.0"
    }
  }
  backend "local" {
    path = "state/terraform.state"
  }
}

provider "digitalocean" {
  token = var.do_token
}