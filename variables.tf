variable "pm_agent_enabled" {
  description = "Enable Proxmox agent (qemu-quest-agent daemon must be installed/running on the guest)"
  type        = number
  default     = 1
}
variable "pm_target_node" {
  description = "Where the guest will be created/destroyed."
  default     = "proxmox"
}
variable "pm_vm_full_clone" {
  description = "Full clone (true) or linked clone (false)"
  default     = "true"
}
variable "pm_vm_os_type" {
  description = "ubuntu, centos or cloud-init"
  default     = "cloud-init"
}
variable "pm_vm_template" {
  description = "The source VM template to clone"
  type        = string
  default     = "bullseye-vm-tmpl"
}
variable "pm_vm_cores" {
  description = "Proxmox guest CPU cores per socket"
  type        = number
  default     = 2
}
variable "pm_vm_sockets" {
  description = "Proxmox guest CPU sockets"
  type        = number
  default     = 1
}
variable "pm_vm_cpu_type" {
  description = "Proxmox guest CPU type"
  default     = "host"
}
variable "pm_vm_memory" {
  description = "Proxmox guest memory in MB"
  type        = number
  default     = 4096
}
variable "pm_vm_scsihw" {
  description = "Proxmox guest SCSI hardware"
  default     = "virtio-scsi-pci"
}
variable "pm_vm_bootdisk" {
  description = "Proxmox guest boot disk"
  default     = "scsi0"
}
variable "pm_vm_disk_size" {
  description = "Proxmox guest disk size"
  type        = string
  default     = "8G"
}
variable "pm_vm_disk_type" {
  description = "Proxmox guest disk type"
  default     = "scsi"
}
variable "pm_vm_disk_storage" {
  description = "Proxmox guest disk storage"
  default     = "local-lvm"
}
variable "pm_vm_disk_iothread" {
  description = "Proxmox guest SSD I/O thread"
  type        = number
  default     = 1
}
variable "pm_vm_network_model" {
  description = "Proxmox guest network model"
  default     = "virtio"
}
variable "pm_vm_network_bridge" {
  description = "Proxmox guest network bridge"
  default     = "vmbr0"
}
variable "pm_vm_ciuser" {
  description = "Proxmox guest CI user"
  default     = "ansibleops"
}
variable "pm_vm_sshkeys" {
  description = "Proxmox guest CI user SSH keys"
  default     = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL5z4HQz55B+OOhiWGmb82sLDBHeqJFUbesQ5n045O0J
  EOF
}
variable "pm_api_url" {
  description = "Proxmox API endpoint URL"
  sensitive   = true
}
variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  sensitive   = true
}
variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  sensitive   = true
}
