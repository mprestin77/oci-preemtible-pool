## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Get the latest Oracle Linux image
data "oci_core_images" "ImageOCID" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.os
  operating_system_version = var.os_version
  shape                    = var.instance_shape
}

# OCI availability domain
data "oci_identity_availability_domain" "AD" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.ad_number
}

