variable "do_token" {
  type = string
}

variable "vm" {
  type    = object({
    count  = number
    region = string
    name   = string
    size   = string
    image  = string
  })
  default = {
    count  = 3
    region = "ams3"
    name   = "kafka"
    size   = "s-1vcpu-2gb"
    image  = "base-dev-image.16-03-2021"
  }
}