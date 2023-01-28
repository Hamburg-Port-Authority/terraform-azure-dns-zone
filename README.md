# Introduction:

The module is used to deploy azure public dns zone over terraform with a default setup (Infrastructure as Code).

# Exmaple Use of Modul:

    module "dns_zone" {
    source              = "github.com/la-cc/terraform-azure-dns-zone?ref=1.0.0"

    name                = var.name
    resource_group_name = var.resource_group_name
    tags                = var.tags

    }
