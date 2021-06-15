resource "google_compute_firewall" "k8s-rules" {
   
  for_each                = { for r in var.rules : r.name => r }
  name                    = each.value.name
  description             = each.value.description
  direction               = each.value.direction
  network                 = var.network_id
  project                 = var.project_id
  source_ranges           = each.value.direction == "INGRESS" ? each.value.source_ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.destination_ranges : null
  source_tags             = each.value.source_tags
  source_service_accounts = each.value.source_service_accounts
  target_tags             = each.value.target_tags
  target_service_accounts = each.value.target_service_accounts
  priority                = each.value.priority

  dynamic "log_config" {
    for_each              = lookup(each.value, "log_config") == null ? [] : [each.value.log_config]
    content {
      metadata            = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each              = lookup(each.value, "allow", [])
    content {
      protocol            = allow.value.protocol
      ports               = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each              = lookup(each.value, "deny", [])
    content {
      protocol            = deny.value.protocol
      ports               = lookup(deny.value, "ports", null)
    }
  }
}