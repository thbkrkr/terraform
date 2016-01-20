output "swarm-keystore-ips" {
  value = "${join(", ", openstack_compute_instance_v2.swarm-keystore.*.access_ip_v4)}"
}

output "swarm-master-ips" {
  value = "${join(", ", openstack_compute_instance_v2.swarm-master.*.access_ip_v4)}"
}

output "swarm-node-ips" {
  value = "${join(", ", openstack_compute_instance_v2.swarm-node.*.access_ip_v4)}"
}
