# terraform-oci-module-example
## Provisioning Infrastructure on OCI Using Terraform Modules
This example shows how to use Terraform modules to provision the following resources:

- It creates a Virtual Cloud Network on OCI with a public and private subnets, security lists and route tables, and enables security rules

- It provisions a pool of preemtible compute instances VMs on the private subnet using all available ADs in the region

   
## Prerequisites

- Permission to `manage` the following types of resources in your Oracle Cloud Infrastructure tenancy: `vcns`, `internet-gateways`, `route-tables`, `security-lists`, `subnets`, and `instances`.

- OCPU Compute Limit for the requested instance shape

If you don't have the required permissions or the compute limit is not set, contact your tenancy administrator. See [Policy Reference](https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Reference/policyreference.htm), [Service Limits](https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm), [Compartment Quotas](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcequotas.htm).

### Clone the Repository
Now, you'll want a local copy of this repo. You can make that with the commands:

    git clone https://github.com/mprestin77/terraform-oci-preemtible-pool
    cd terraform-oci-preemtible-pool
    ls

### Prerequisites
First off, you'll need to do some pre-deploy setup.  That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Secondly, create a `terraform.tfvars` file and populate with the following information:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid        = "<compartment_ocid>"

````
You can edit variables.tf file and and set values based on your requirements

### Create the Resources
Download the latest Terraform version from https://www.terraform.io/downloads. Run the following commands:

    terraform init
    terraform plan
    terraform apply

### Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy the resources:

    terraform destroy

```

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.

