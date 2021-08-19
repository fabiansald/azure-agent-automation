# Landing Zone variables

variable "resgroup" {
  type    = string
  default = "azagents"
}

variable "milocation" {
  type    = string
  default = "eastus2"
}

variable "vmname" {
  type    = string
  default = "azagentdeb1"
}

variable "user" {
  type    = string
  default = "azureps"
}

variable "sshkey" {
  type    = list(string)
  default = ["~/fabs", "~/fabs.pub"]
}

variable "centos" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_3"
    version   = "latest"
  }
}

variable "debian" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Debian"
    offer     = "debian-10"
    sku       = "10"
    version   = "latest"
  }
}

variable "ubuntu" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "cognosys"
    offer     = "ubuntu-20-04-lts"
    sku       = "ubuntu-20-04-lts"
    version   = "latest"
  }
}