resource "google_compute_network" "network" {
  name                            = var.network_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  project                         = var.project_id
  description                     = var.description_vpc
  delete_default_routes_on_create = var.delete_default_internet_gateway_routes
  mtu                             = var.mtu
}
