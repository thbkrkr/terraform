variable "prefix" {}

variable "nb_nodes" {
  default = 1
}

variable "image" {
  default = "Ubuntu 17.10"
}

variable "flavor" {
  default = "s1-8"
}

variable "region" {
  default = "SBG3"
}

variable "admin_cidr" {
  default = "0.0.0.0/0"
}

variable "ssh_public_key" {}

resource "openstack_compute_keypair_v2" "keypair-nodes" {
  name = "${replace(var.prefix, "/./", "-")}-keypair-bare"
  public_key = "${var.ssh_public_key}"
}

resource "openstack_compute_secgroup_v2" "sg-nodes-public" {
  name = "${replace(var.prefix, ".", "-")}-sg-public"
  description = "0-65535 from ALL"
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_instance_v2" "node" {
  name = "${var.prefix}-node${count.index + 1}"
  count = "${var.nb_nodes}"
  metadata {
    group = "${var.prefix}"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"

  key_pair="${openstack_compute_keypair_v2.keypair-nodes.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.sg-nodes-public.name}",
  ]
}

output "ips" {
  value = ["${openstack_compute_instance_v2.node.*.access_ip_v4}"]
}