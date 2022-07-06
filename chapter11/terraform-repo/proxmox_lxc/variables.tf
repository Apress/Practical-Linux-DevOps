variable "ssh_key" { 
  default = "[Your ~/.ssh/id_rsa.pub key]"
}

variable "lxc_proxmox_host_name" {
    default = "ubuntu-lxc-01"
}

variable "lxc_template_name" {
    default = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
}

variable "root_password" {
    default = "password"
}

variable "cidr" {
  default = "10.128.1.51/24"
}

variable "ip" {
  default = "10.128.1.51"
}
