
resource "openstack_compute_instance_v2" "swarm-keystore" {
  name = "${var.prefix}-keystore-${count.index + 1}"
  count = "${var.nb_keystores}"
  metadata {
    group = "keystores"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"

  key_pair="${openstack_compute_keypair_v2.keypair-swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.sg-swarm-admin-consul.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-admin.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-internal.name}"
  ]
}

resource "openstack_compute_instance_v2" "swarm-master" {
  name = "${var.prefix}-master-${count.index + 1}"
  count = "${var.nb_masters}"
  metadata {
    group = "masters"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"

  key_pair="${openstack_compute_keypair_v2.keypair-swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.sg-swarm-public.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-admin.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-internal.name}"
  ]
}

resource "openstack_compute_instance_v2" "swarm-node" {
  name = "${var.prefix}-node-${count.index + 1}"
  count = "${var.nb_nodes}"
  metadata {
    group = "nodes"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"

  key_pair="${openstack_compute_keypair_v2.keypair-swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.sg-swarm-public.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-admin.name}",
    "${openstack_compute_secgroup_v2.sg-swarm-internal.name}"
  ]
}
