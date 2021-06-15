variable "project_id" {
  type        = string
  description = "The ID of the project will be created"
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}

variable "tags" {
  type        = list(string)
  description = "tags to the instances machines"
}


variable "instances" {
  description = "Count of virtualmachines"
  default     = 1
}



variable "machine_type" {
  description = "machine_type of instance"
  type        = string
}

variable "type" {
  description = "type of disk"
  type        = string
}


variable "size" {
  description = "size of disk"
  type        = string
}


variable "network_id" {
  type        = string
  description = "The name of the network being created"
}


variable "subnet_id" {
  type        = string
  description = "The name of the subnet being created"
}

variable "zone" {
  type        = string
  description = "Zone of Machine creation"
}

#### Variabler for image search

variable "family" {
  type        = string
  description = "Family of OS"
}

variable "project" {
  type        = string
  description = "Project of OS family"
}

variable "hostname" {
  type        = string
  description = "Name of the instance"

}

variable "startup_script" {
  type        = string
  description = "Shell script to start with the Instance (ATENTION: Danger config to production!)"

}