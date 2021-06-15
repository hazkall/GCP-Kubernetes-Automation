##################################################### FIREWALL RULES ################################################################
  rules = [
  
  {
    name                     = "allow-ssh"
    description              = "SSH connection on Nodes"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = ["0.0.0.0/0"]
    destination_ranges       = null
    source_tags              = null
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["22"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },
  
  # Kubernetes Rules
  {
    name                     = "allow-kubernetes-cluster-flow"
    description              = "Kubernetes flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["6443", "2379-2380", "10248", "10250", "10251", "10252", "80", "8080"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

  # Kubernetes NodePort Rules to enter on cluster
  {
    name                     = "allow-kubernetes-nodeport-flow"
    description              = "nodeport-flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = ["0.0.0.0/0"]
    destination_ranges       = null
    source_tags              = null
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["30000-32767"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },


  
  # Calico Project Podnetwork rules TCP
  {
    name                     = "allow-calico-tcp"
    description              = "calico tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["179", "5473", "443"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

  # Calico Project Podnetwork rules UDP

  {
    name                     = "allow-calico-udp"
    description              = "calico ucp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow = [{
      protocol               = "udp"
      ports                  = ["4789"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },


# NFS Server firewalll ports TCP

  {
    name                     = "allow-nfs-tcp"
    description              = "nfs tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["2049", "111", "2046", "892", "4045"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },


# NFS Server firewalll ports UDP

  {
    name                     = "allow-nfs-udp"
    description              = "nfs tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "udp"
      ports                  = ["2049", "111", "2046", "892", "4045"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },




# Prometheus Operator firewalll ports

  {
    name                     = "allow-prometheus-tcp"
    description              = "prometheus tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["9090", "9091", "9092", "9093", "9094", "9100", "9153"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

# Cluster DNS ports
  {
    name                     = "allow-cluster-dns-tcp"
    description              = "dns tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["53"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

  {
    name                     = "allow-cluster-dns-udp"
    description              = "dns tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "udp"
      ports                  = ["53"]
    }]

    deny                     = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

# Grafana firewalll ports

  {
    name                     = "allow-grafana-tcp"
    description              = "grafana tcp flow"
    direction                = "INGRESS"
    priority                 = 1000
    source_ranges            = null
    destination_ranges       = null
    source_tags              = ["kubernetes"]
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    allow                    = [{
      protocol               = "tcp"
      ports                  = ["3000"]
    }]

    deny = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  }

############################################## Optional Egress and DENY Sample #########################################
  #Deny policies
  /*
    {
    name                     = "deny-policies"
    description              = "Deny all flows [Last priority]"
    direction                = "INGRESS"
    priority                 = 2000
    source_ranges            = ["0.0.0.0/0"]
    destination_ranges       = null
    source_tags              = null
    source_service_accounts  = null
    target_tags              = ["kubernetes"]
    target_service_accounts  = null

    deny                     = [{
      protocol               = "all"
      ports                  = []
    }]

    allow                    = []

    log_config               = {
      metadata               = "INCLUDE_ALL_METADATA"
    }
  },

 

  # Egress rules of cluster

  {
    name                    = "allow-any-egress"
    description             = "Any Egress its ok"
    direction               = "EGRESS"
    priority                = 1000
    source_ranges           = null
    destination_ranges      = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["kubernetes"]
    target_service_accounts = null

    allow                   = [{
      protocol              = "all"
      ports                 = []
    }]

    deny                    = []

    log_config              = {
      metadata              = "INCLUDE_ALL_METADATA"
    }
  }*/

 ############################################## Optional  ###############################################################################

]

##################################################### END FIREWALL RULES ################################################################



# Variables for all resources
project_id                             = "felipe-root-project"
region                                 = "us-east1"
zone                                   = "us-east1-b"


# VPC
network_name                           = "cka-network-k8s"
auto_create_subnetworks                = false
routing_mode                           = "GLOBAL"
description_vpc                        = "Network for Kubernetes Nodes - CKA"
delete_default_internet_gateway_routes = false
mtu                                    = 1460


# Subnet
subnet_name                            = "cka-subnet-k8s"
ipv4                                   = "10.1.1.0/28"
description_subnet                     = "SubNetwork for Kubernetes Nodes - CKA"

#Compute
tags                                   = ["kubernetes"]
instances                              = 2
machine_type                           = "e2-medium"
type                                   = "pd-standard"
size                                   = "20"
family                                 = "centos-7"
project                                = "centos-cloud"
hostname                               = "cka-node"
startup_script                         = "sudo yum update -y && sudo yum upgrade -y"