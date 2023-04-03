module "network" { 
  source = "./modules/network"
  tenancy_ocid = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
  region = var.region
  use_existing_vcn = var.use_existing_vcn
  vcn_cidr = var.network_params["vcn_cidr"]
  public_subnet_cidr = var.network_params["public_subnet_cidr"]
  private_subnet_cidr = var.network_params["private_subnet_cidr"]
  vcn_name = var.network_params["vcn_name"]
  vcn_dns_label  = var.network_params["vcn_dns_label"]
  vcn_id = var.vcn_id
  public_subnet_id = var.public_subnet_id
  private_subnet_id = var.private_subnet_id
}

module "instance-pool1" {
  depends_on = [module.network]
  count = var.instance-config1["instance_count"] > 0 ? 1 : 0
  source = "./modules/compute"
  user_data = base64encode(file("userdata/scripts/cloudinit.sh")) 
  tenancy_ocid = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
#  availability_domain = data.oci_identity_availability_domain.ad1.name
  ad_number = var.instance-config1["ad_number"]
  instance_name = var.instance-config1["name"]
  instance_shape   = var.instance-config1["shape"]
  ocpu = var.instance-config1["ocpu"]
  memory = var.instance-config1["memory"]
  instance_count = var.instance-config1["instance_count"]
  os = var.instance-config1["os"]
  os_version = var.instance-config1["os_version"]
  use_custom_image = var.instance-config1["use_custom_image"]
  image_ocid = local.image_ocid
  create_in_private_subnet = var.instance-config1["create_in_private_subnet"]
  subnet_id = var.use_existing_vcn ? var.private_subnet_id : module.network.private_subnet_id
  ssh_public_key = var.ssh_provided_public_key != ""? var.ssh_provided_public_key : tls_private_key.ssh_key.public_key_openssh 
  is_preemptible = var.instance-config1["is_preemptible"] 
}

module "instance-pool2" {
  depends_on = [module.network]
  count = var.instance-config2["instance_count"] > 0 ? 1 : 0
  source = "./modules/compute"
  user_data = base64encode(file("userdata/scripts/cloudinit.sh")) 
  tenancy_ocid = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
#  availability_domain = data.oci_identity_availability_domain.ad2.name
  ad_number = var.instance-config2["ad_number"]
  instance_name = var.instance-config2["name"]
  instance_shape   = var.instance-config2["shape"]
  ocpu = var.instance-config2["ocpu"]
  memory = var.instance-config2["memory"]
  instance_count = var.instance-config2["instance_count"]
  os = var.instance-config2["os"]
  os_version = var.instance-config2["os_version"]
  use_custom_image = var.instance-config2["use_custom_image"]
  image_ocid = local.image_ocid
  create_in_private_subnet = var.instance-config2["create_in_private_subnet"]
  subnet_id = var.use_existing_vcn ? var.private_subnet_id : module.network.private_subnet_id
  ssh_public_key = var.ssh_provided_public_key != "" ? var.ssh_provided_public_key : tls_private_key.ssh_key.public_key_openssh 
  is_preemptible = var.instance-config2["is_preemptible"] 
}

module "instance-pool3" {
  depends_on = [module.network]
  count = var.instance-config3["instance_count"] > 0 ? 1 : 0
  source = "./modules/compute"
  user_data = base64encode(file("userdata/scripts/cloudinit.sh")) 
  tenancy_ocid = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
#  availability_domain = data.oci_identity_availability_domain.ad3.name
  ad_number = var.instance-config3["ad_number"]
  instance_name = var.instance-config3["name"]
  instance_shape   = var.instance-config3["shape"]
  ocpu = var.instance-config3["ocpu"]
  memory = var.instance-config3["memory"]
  instance_count = var.instance-config3["instance_count"]
  os = var.instance-config3["os"]
  os_version = var.instance-config3["os_version"]
  use_custom_image = var.instance-config3["use_custom_image"]
  image_ocid = local.image_ocid
  create_in_private_subnet = var.instance-config3["create_in_private_subnet"]
  subnet_id = var.use_existing_vcn ? var.private_subnet_id : module.network.private_subnet_id
  ssh_public_key = var.ssh_provided_public_key != "" ? var.ssh_provided_public_key : tls_private_key.ssh_key.public_key_openssh 
  is_preemptible = var.instance-config3["is_preemptible"] 
}

module "bastion" {
  depends_on = [module.network]
  count = var.create_bastion ? 1 : 0
  source = "./modules/bastion"
  compartment_ocid = var.compartment_ocid
  subnet_id = var.use_existing_vcn ? var.private_subnet_id : module.network.private_subnet_id
}
