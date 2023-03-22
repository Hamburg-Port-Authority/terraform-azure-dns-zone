
resource "azurerm_dns_zone" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags


  dynamic "soa_record" {
    for_each = var.soa_default ? [] : var.soa_records

    content {

      email         = soa_record.value["email"]
      host_name     = soa_record.value["host_name"]
      expire_time   = soa_record.value["expire_time"]
      minimum_ttl   = soa_record.value["minimum_ttl"]
      refresh_time  = soa_record.value["refresh_time"]
      retry_time    = soa_record.value["retry_time"]
      serial_number = soa_record.value["serial_number"]
      ttl           = soa_record.value["ttl"]
      tags          = soa_record.value["tags"]
    }
  }


}

resource "azurerm_dns_a_record" "main" {
  for_each = var.a_records_disabled ? {} : var.a_records


  name                = each.value.name
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records

  tags = var.tags
}


resource "azurerm_dns_ns_record" "main" {
  for_each            = var.ns_records_disabled ? {} : var.ns_records
  name                = each.value.name
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records

  tags = var.tags
}
