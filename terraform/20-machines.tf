data "digitalocean_droplet_snapshot" "vm_snapshot" {
  name        = var.vm.image
  region      = "ams3"
  most_recent = true
}

resource "digitalocean_droplet" "vm" {
  count  = var.vm.count
  image  = data.digitalocean_droplet_snapshot.vm_snapshot.id
  name   = "vm-${var.vm.name}-${count.index}"
  region = var.vm.region
  size   = var.vm.size
  tags   = compact([
    "cluster",
    count.index == 0 ? "zookeeper" : "kafka",
    count.index != 0 ? "broker${count.index}" : ""
  ])
}

output "instance_ip_addr" {
  value       = digitalocean_droplet.vm.*.ipv4_address
  description = "The IP addresses of the deployed instances, paired with their IDs."
}