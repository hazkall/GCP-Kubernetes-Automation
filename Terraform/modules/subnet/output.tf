output "subnet_id" {
  value       = google_compute_subnetwork.subnetwork.id
  description = "VPC network id"
}