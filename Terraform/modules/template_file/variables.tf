variable "public_ip_template" {
    type        = list(list(string))
    description = "Public IP collected from compute module"
}

variable "private_ip_template" {
    type        = list(list(string))
    description = "Private IP collected from compute module"
} 

variable "hostname_template" {
    type        = list(string)
    description = "Hostname collected from compute module"
} 