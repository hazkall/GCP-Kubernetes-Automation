###### Variables for all resources ######
variable project_id {
  type        = string
  description = "Admin Project ID"
}

variable region {
  type        = string
  description = "Region on GCP"
}

variable zone {
  type        = string
  description = "Zone on GCP"
}


###### Firewall variables ######

variable "rules" {}


###### VPC variables ######

variable "network_name" {}
variable "auto_create_subnetworks" {}
variable "routing_mode" {}
variable "description_vpc" {}
variable "delete_default_internet_gateway_routes" {}
variable "mtu" {}


###### Subnet variables ######

variable "subnet_name" {}
variable "ipv4" {}
variable "description_subnet" {}

#Compute

variable "tags" {}
variable "instances" {}
variable "machine_type" {}
variable "type" {}
variable "size" {}
variable "family" {}
variable "project" {}
variable "hostname" {}
variable "startup_script" {}