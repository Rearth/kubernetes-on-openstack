output "master_ip" {
  value = "ssh ubuntu@${openstack_networking_floatingip_v2.public_ip.address}"
}

output "login" {

  value = <<login
kubectl config set-cluster --insecure-skip-tls-verify=true --server='https://${openstack_networking_floatingip_v2.public_ip.address}:6443' ${var.cluster_name}
kubectl config set-credentials ${var.username} --auth-provider=openstack
kubectl config set-context --cluster=${var.cluster_name} --user=${var.username}  ${var.username}
kubectl config use-context ${var.username}
    login
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
