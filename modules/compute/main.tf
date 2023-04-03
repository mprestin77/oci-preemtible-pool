## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


resource "oci_core_instance" "instance" {
  async               = true
  count               = var.instance_count
  availability_domain = data.oci_identity_availability_domain.AD.name
  compartment_id      = var.compartment_ocid
  display_name        = "${var.instance_name}-${count.index+1}"
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.ocpu
    memory_in_gbs = var.memory
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = var.create_in_private_subnet ? false : true
  }

  source_details {
    source_type = "image"
    source_id   = var.use_custom_image ? var.image_ocid : data.oci_core_images.ImageOCID.images[0].id
  }

  dynamic preemptible_instance_config {
    for_each = var.is_preemptible ? [1] : []
    content {
     preemption_action {
      type = "TERMINATE"
      preserve_boot_volume = false
     }
    }
  } 

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = var.user_data
  }

#  dynamic "agent_config" {
#    for_each = var.create_in_private_subnet ? [1] : []
#    content {
#      are_all_plugins_disabled = false
#      is_management_disabled   = false
#      is_monitoring_disabled   = false
#      plugins_config {
#        desired_state = "ENABLED"
#        name          = "Bastion"
#      }
#    }
#  }

}
