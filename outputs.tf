## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


output "generated_ssh_private_key" {
  value     = nonsensitive(tls_private_key.ssh_key.private_key_pem)
}
