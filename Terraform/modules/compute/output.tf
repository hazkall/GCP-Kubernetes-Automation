output "instance_public_ip" {
  description = "The public IP of the instance"
  value       = google_compute_instance.default[*].network_interface[*].access_config.0.nat_ip
}

output "instance_private_ip" {
  description = "The private IP of the instance"
  value       = google_compute_instance.default[*].network_interface[*].network_ip
}

output "instance_name" {
  description = "The private IP of the instance"
  value       = google_compute_instance.default[*].id
}

output "hostname" {
  description = "name of the instance"
  value       = google_compute_instance.default[*].name
}