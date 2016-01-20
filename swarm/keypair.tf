resource "openstack_compute_keypair_v2" "keypair-swarm" {
  name = "${var.prefix}-keypair-swarm"
  public_key = "${var.ssh_public_key}"
}