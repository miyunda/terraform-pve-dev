terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "pve-tf" {
  count       = 1
  agent       = var.pm_agent_enabled
  vmid        = 301 + count.index
  name        = "k8s-dev-0${1 + count.index}"
  target_node = var.pm_target_node
  clone       = var.pm_vm_template
  full_clone  = var.pm_vm_full_clone
  os_type     = var.pm_vm_os_type
  cores       = var.pm_vm_cores
  sockets     = var.pm_vm_sockets
  cpu         = var.pm_vm_cpu_type
  memory      = var.pm_vm_memory
  scsihw      = var.pm_vm_scsihw
  bootdisk    = var.pm_vm_bootdisk
  desc        = "Built by ${var.pm_vm_desc}"
  disk {
    size    = var.pm_vm_disk_size
    type    = var.pm_vm_disk_type
    storage = var.pm_vm_disk_storage
    #storage_type = "lvmthin"
    iothread = var.pm_vm_disk_iothread
  }
  network {
    model  = var.pm_vm_network_model
    bridge = var.pm_vm_network_bridge
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  # Create Ansible user, introduce its SSH key pub.
  ciuser  = var.pm_vm_ciuser
  sshkeys = var.pm_vm_sshkeys
}
