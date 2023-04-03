output "private_ip" {
	value = oci_core_instance.instance.*.private_ip
}
output "instance_count" {
	value = length(oci_core_instance.instance.*.private_ip)
}
output "instance_shape" {
	value = var.instance_shape
}
#output "public_ip" {
#	value = oci_core_instance.instance.*.public_ip
#}
