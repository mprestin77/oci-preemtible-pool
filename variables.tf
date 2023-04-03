## Copyright (c) 2021 Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}


locals {
  image_ocid    = ""     # Enter here OCID of the image if you provision compute instances from a custom image 
}

# ---------------------------------------------------------------------------------------------------------------------
# If attach to existing VCN set use_existing_vcn = true and set vcn_id, public_subnet_id and private_subnet_id values
# ---------------------------------------------------------------------------------------------------------------------
variable "use_existing_vcn" {
  default = false
}

variable "vcn_id" {
  default = ""
}

variable "public_subnet_id" {
  default = ""
}

variable "private_subnet_id" {
  default = ""
}

# ---------------------------------------------------------------------------------------------------------------------
# If create a new VCN set vcn CIDR, public and private subnets CIDR
# ---------------------------------------------------------------------------------------------------------------------
variable "network_params" {
  type = map(string)
  default = {
    vcn_cidr = "10.0.0.0/16"
    public_subnet_cidr = "10.0.100.0/24"
    private_subnet_cidr = "10.0.0.0/21"
    vcn_name  = "testvcn"
    vcn_dns_label  = "testvcn"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Create bastion service
# ---------------------------------------------------------------------------------------------------------------------
variable "create_bastion" {
  default = false
}

# ---------------------------------------------------------------------------------------------------------------------
# SSH public Key 
# ---------------------------------------------------------------------------------------------------------------------
variable "ssh_provided_public_key" {
  default = ""
}

# ---------------------------------------------------------------------------------------------------------------------
# Compute instance configurations
# ---------------------------------------------------------------------------------------------------------------------
variable "instance-config1" {
  type = map(string)
  default = {
    name = "test1"
    shape = "VM.Standard.E4.Flex"
    ocpu = 28
    memory = 64
    instance_count = 10
    os = "Oracle Linux"
    os_version = "8"
    create_in_private_subnet = true
    use_custom_image = false
    is_preemptible = true
    ad_number = 1
  }
}

variable "instance-config2" {
  type = map(string)
  default = {
    name = "test2"
    shape = "VM.Standard.E4.Flex"
    ocpu = 28
    memory = 64
    instance_count = 10
    os = "Oracle Linux"
    os_version = "8"
    create_in_private_subnet = true
    use_custom_image = false
    is_preemptible = false
    ad_number = 2
  }
}

variable "instance-config3" {
  type = map(string)
  default = {
    name = "test3"
    shape = "VM.Standard3.Flex"
    ocpu = 28
    memory = 64
    instance_count = 10
    os = "Oracle Linux"
    os_version = "8"
    create_in_private_subnet = true
    use_custom_image = false
    is_preemptible = true
    ad_number = 3
  }
}


