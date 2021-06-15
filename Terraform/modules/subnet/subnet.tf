resource "google_compute_subnetwork" "subnetwork" {
  
  name                     = var.subnet_name
  ip_cidr_range            = var.ipv4
  region                   = var.region
  network                  = var.network_id
  project                  = var.project_id
  description              = var.description_subnet

  log_config {
    
    aggregation_interval   = "INTERVAL_10_MIN"
    flow_sampling          = 0.5
    metadata               = "INCLUDE_ALL_METADATA"
  }

}