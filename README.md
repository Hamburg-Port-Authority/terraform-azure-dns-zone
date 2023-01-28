# Introduction:

The module is used to deploy azure public dns zone over terraform with a default setup (Infrastructure as Code).

> **_NOTE:_** The required providers, providers configuration and terraform version are maintained in the user's configuration and are not maintained in the modules themselves.

# Example Use of Module:

    module "dns_zone" {
    source              = "github.com/la-cc/terraform-azure-dns-zone?ref=1.0.0"

    name                = var.name
    resource_group_name = var.resource_group_name
    tags                = var.tags

    }
