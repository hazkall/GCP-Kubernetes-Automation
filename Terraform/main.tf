#Terraform drivers for gcp
##################GCP Terraform Configuration ###################
terraform {
  required_providers {
    google    = {
      source  = "hashicorp/google"
      version = "3.68.0"
    }
  }
}

provider "google" {

  project    = var.project_id
  region     = var.region
  zone       = var.zone
}

terraform {
  backend "gcs" {
    bucket   = "terraform-state-prod-felipe"
    prefix   = "terraform/state"
  }
}
