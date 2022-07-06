terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.6"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://pve01.devops.lab:8006/api2/json"
}

resource "proxmox_lxc" "advanced_features" {
  target_node  	= "pve01"
  hostname     	= var.lxc_proxmox_host_name
  ostemplate   	= var.lxc_template_name
  password     	= var.root_password
  unprivileged 	= true
  ssh_public_keys 	= var.ssh_key
  searchdomain  	= "devops.lab"
  start        	= true

  rootfs {
    storage = "zfs"
    size    = "2G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = var.cidr
    gw     = "10.128.1.1"
  }

  connection {
    type  = "ssh"
    user  = "root"
    host  = var.ip
    private_key = "${file("~/.ssh/id_rsa")}"
  } 

  provisioner "file" {
    source = "nginx.yml”
    destination = "/root/nginx.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install -y ansible"
      "/usr/bin/ansible-playbook /root/nginx.yml
    ]
  }
}
