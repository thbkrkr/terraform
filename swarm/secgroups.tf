# Security groups

resource "openstack_compute_secgroup_v2" "sg-swarm-public" {
  name = "${var.prefix}-sg-swarm-public"
  description = "80-90 from ALL"
  rule {
    from_port = 80
    to_port = 90
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "sg-swarm-admin" {
  name = "${var.prefix}-sg-swarm-admin"
  description = "22, 2376 from admin CIDR"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "${var.admin_cidr}"
  }
  rule {
    from_port = 2376
    to_port = 2376
    ip_protocol = "tcp"
    cidr = "${var.admin_cidr}"
  }
}

resource "openstack_compute_secgroup_v2" "sg-swarm-internal" {
  name = "${var.prefix}-sg-swarm-internal"
  description = "All TCP/UDP in internal"
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    from_group_id = "${openstack_compute_secgroup_v2.sg-swarm-admin.id}"
  }
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    from_group_id = "${openstack_compute_secgroup_v2.sg-swarm-admin.id}"
  }
}

resource "openstack_compute_secgroup_v2" "sg-swarm-admin-consul" {
  name = "${var.prefix}-sg-swarm-admin-consul"
  description = "8500 from admin CIDR"
  rule {
    from_port = 8500
    to_port = 8500
    ip_protocol = "tcp"
    cidr = "${var.admin_cidr}"
  }
}