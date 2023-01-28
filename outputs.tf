output "name_servers" {

  description = "A list of values that make up the NS record for the zone."
  value       = azurerm_dns_zone.main.name_servers

}

output "id" {

  description = "The DNS Zone ID."
  value       = azurerm_dns_zone.main.id

}

output "max_number_of_record_sets" {

  description = "Maximum number of Records in the zone. Defaults to 1000"
  value       = azurerm_dns_zone.main.max_number_of_record_sets
}

output "number_of_record_sets" {

  description = "The number of records already in the zone."
  value       = azurerm_dns_zone.main.number_of_record_sets
}

