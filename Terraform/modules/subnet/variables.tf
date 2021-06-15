variable "project_id" {
  type        = string
  description = "The ID of the project will be created"
}

variable "network_id" {
  type        = string
  description = "The name of the network being created"
}

variable "ipv4" {
  description = "ip_cidr_range IPV4"
}

variable "description_subnet" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}


variable "region" {
  type        = string
  description = "Region of creation of VPC"
}


variable "subnet_name" {
  type        = string
  description = "The name of the subnetwork being created"
}