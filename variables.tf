# Landing Zone variables

variable "resgroup" {
  type    = string
  default = "azagent1"
}

variable "milocation" {
  type    = string
  default = "eastus2"
}

variable "user" {
  type = string 
  default = "azureps"
}

variable "centos" {
  type = map(object({
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "8_3"
        version   = "latest"
      }))
  }

variable "debian" {
  type = map(object({
        publisher = "Debian"
        offer     = "debian-10"
        sku       = "10"
        version   = "latest"
      }))
  }

variable "ubuntu" {
  type = map(object({
        publisher = "cognosys"
        offer     = "ubuntu-20-04-lts"
        sku       = "ubuntu-20-04-lts"
        version   = "latest"
      }))
  }