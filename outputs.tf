output "master_ip" {
  value = "${openstack_networking_floatingip_v2.public_ip.address}"
}

output "master_internal_ip" {
  value = "${openstack_compute_instance_v2.master.access_ip_v4}"
}

output "network_id" {
  description = "Network id of the Network"
  value       = "${openstack_networking_network_v2.private.id}"
}

output "router_id" {
  description = "Router id"
  value       = "${openstack_networking_router_v2.cluster_router.id}"
}

output "router_interface_id" {
  description = "Router interface id"
  value       = "${openstack_networking_router_interface_v2.cluster_subnet_interface.id}"
}
