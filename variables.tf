variable "name" {
  type        = string
  description = "The name of the DNS Zone. Must be a valid domain name."
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the resource group where the resource exists. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "soa_default" {

  type        = bool
  description = "If the value is not set by the user, then the default values from Microsoft for the SOA record are used."
  default     = true

}


variable "soa_records" {

  type = list(object({

    email         = string
    host_name     = string
    expire_time   = string
    minimum_ttl   = string
    refresh_time  = string
    retry_time    = string
    serial_number = string
    ttl           = string
    tags          = map(string)
  }))

  default = [{
    email         = "azuredns-hostmaster.microsoft.com"
    host_name     = "ns1-03.azure-dns.com"
    expire_time   = "2419200"
    minimum_ttl   = "300"
    refresh_time  = "3600"
    retry_time    = "300"
    serial_number = "1"
    ttl           = "3600"
    tags          = {}
  }]


  description = <<-EOT

    The following shows the possible configuration of SOA Record by the terraform provider:

    email - (Required) The email contact for the SOA record.
    host_name - (Required) The domain name of the authoritative name server for the SOA record. Defaults to ns1-03.azure-dns.com.
    expire_time - (Optional) The expire time for the SOA record. Defaults to 2419200.
    minimum_ttl - (Optional) The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to 300.
    refresh_time - (Optional) The refresh time for the SOA record. Defaults to 3600.
    retry_time - (Optional) The retry time for the SOA record. Defaults to 300.
    serial_number - (Optional) The serial number for the SOA record. Defaults to 1.
    ttl - (Optional) The Time To Live of the SOA Record in seconds. Defaults to 3600.
    tags - (Optional) A mapping of tags to assign to the Record Set.

    For further details see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone

    Example of variable use:

    variable "soa_records" {

      type = list(object({

        email         = string
        host_name     = string
        expire_time   = string
        minimum_ttl   = string
        refresh_time  = string
        retry_time    = string
        serial_number = string
        ttl           = string
        tags          = map(string)
      }))

      default = [{
        email         = "azuredns-hostmaster.microsoft.com"
        host_name     = "ns1-03.azure-dns.com"
        expire_time   = "2419200"
        minimum_ttl   = "300"
        refresh_time  = "3600"
        retry_time    = "300"
        serial_number = "1"
        ttl           = "3600"
        tags          = {}
      }]
  }
    EOT
}

variable "a_records_disabled" {

  type        = bool
  description = "By default no A record is expected, so it is disabled."
  default     = true

}

variable "a_records" {

  type = map(object({

    name    = string
    ttl     = string
    records = list(string)
    tags    = map(string)
  }))

  default = {
    "default_example" = {
      name    = "default"
      ttl     = "300"
      records = ["10.0.180.17"]
      tags = {
        "default" = "true"
      }
    }
  }


  description = <<-EOT

    The following shows the possible configuration of A Record by the terraform provider:

    name - (Required) The name of the DNS A Record.
    resource_group_name - (Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created.
    zone_name - (Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created.
    ttl - (Required) The Time To Live (TTL) of the DNS record in seconds.
    records - (Optional) List of IPv4 Addresses. Conflicts with target_resource_id.
    target_resource_id - (Optional) The Azure resource id of the target object. Conflicts with records.

    For further details see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record#zone_name

    Example of variable use:

    variable "a_records" {

      type = map(object({

        name    = string
        ttl     = string
        records = list(string)
        tags    = map(string)
      }))

      default = {
        "default_example" = {
          name    = "default"
          ttl     = "300"
          records = ["10.0.180.17"]
          tags = {
            "default" = "true"
          }
      }
    }

    EOT
}

variable "ns_records_disabled" {

  type        = bool
  description = "By default no NS record is expected, so it is disabled."
  default     = true

}
variable "ns_records" {

  type = map(object({

    name    = string
    ttl     = string
    records = list(string)

  }))

  default = {}


  description = <<-EOT

    The following shows the possible configuration of A Record by the terraform provider:

    name - (Required) The name of the DNS A Record.
    resource_group_name - (Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created.
    zone_name - (Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created.
    ttl - (Required) The Time To Live (TTL) of the DNS record in seconds.
    records - (Optional) List of IPv4 Addresses. Conflicts with target_resource_id.
    target_resource_id - (Optional) The Azure resource id of the target object. Conflicts with records.

    For further details see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record#zone_name

    Example of variable use:

    variable "a_records" {

      type = map(object({

        name    = string
        ttl     = string
        records = list(string)
        tags    = map(string)
      }))

      default = {
        "default_example" = {
          name    = "default"
          ttl     = "300"
          records = ["10.0.180.17"]
          tags = {
            "default" = "true"
          }
      }
    }

    EOT
}


variable "tags" {
  type        = map(string)
  description = "Defines the default tags.  Some tags like owner are enforced by Azure policies."
  default = {
    TF-Managed  = "true"
    TF-Worfklow = ""
    Maintainer  = ""
  }
}
