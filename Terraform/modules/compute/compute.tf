data "google_compute_image" "my_image" {
  family       = var.family
  project      = var.project
}


resource "google_compute_instance" "default" {
  count        = var.instances
  name         = "${var.hostname}-${count.index +1}"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  project      = var.project_id

  boot_disk {
    initialize_params {
      image    = data.google_compute_image.my_image.self_link
      type     = var.type
      size     = var.size
    }
  }

  metadata_startup_script = var.startup_script

  network_interface {

    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {/* Include this section to give the VM an external ip address*/}
  }

  metadata = {
    app        = "kubernetes"
  }
}