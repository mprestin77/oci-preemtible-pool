## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


#output "instances_pool1" {
#  value     = length(module.instance-pool1.*.instance_count) > 0 ? module.instance-pool1.*.private_ip : null
#}

output "instance_count_pool1" {
  value     = length(module.instance-pool1.*.instance_count) > 0 ? join("",module.instance-pool1.*.instance_count) : null
}

output "instance_shape_pool1" {
  value     = length(module.instance-pool1.*.instance_count) > 0 ? var.instance-config1["shape"] : null
}

#output "instances_pool2" {
#  value     = length(module.instance-pool2.*.instance_count) > 0 ? module.instance-pool2.*.private_ip : null
#}

output "instance_count_pool2" {
  value     = length(module.instance-pool2.*.instance_count) > 0 ? join("",module.instance-pool2.*.instance_count) : null
}

output "instance_shape_pool2" {
  value     = length(module.instance-pool2.*.instance_count) > 0 ? var.instance-config2["shape"] : null
}

#output "instances_pool3" {
#  value     = length(module.instance-pool3.*.instance_count) > 0 ? module.instance-pool3.*.private_ip : null
#}

output "instance_count_pool3" {
  value     = length(module.instance-pool3.*.instance_count) > 0 ? join("",module.instance-pool3.*.instance_count) : null
}

output "instance_shape_pool3" {
  value     = length(module.instance-pool3.*.instance_count) > 0 ? var.instance-config3["shape"] : null
}

output "generated_ssh_private_key" {
  value     = var.ssh_provided_public_key == "" ? nonsensitive(tls_private_key.ssh_key.private_key_pem) : null
}
