variable "prefix" {}

variable "nb_keystores" {
  default = 1
}

variable "nb_masters" {
  default = 1
}

variable "nb_nodes" {
  default = 1
}

variable "image" {
  default = "Ubuntu 15.10"
}

variable "flavor" {
  default = "eg-7"
}

variable "region" {
  default = "GRA-1"
}

variable "admin_cidr" {
  default = "0.0.0.0/0"
}

variable "ssh_public_key" {}
