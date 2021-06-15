variable "rules" {
  
  description = "List of custom rule definitions (refer to variables file for syntax)."
  type = list(object({
      
    name                    = string
    description             = string
    direction               = string
    priority                = number
    source_ranges           = list(string)
    destination_ranges      = list(string)
    source_tags             = list(string)
    source_service_accounts = list(string)
    target_tags             = list(string)
    target_service_accounts = list(string)
    allow                   = list(object({
      protocol              = string
      ports                 = list(string)
    }))
    deny = list(object({
      protocol              = string
      ports                 = list(string)
    }))

    log_config              = object({
      metadata              = string
    })

  }))
}

variable "project_id" {
  type                    = string
  description             = "The ID of the project will be created"
}

variable "network_id" {
  type                    = string
  description             = "The name of the network being created"
}