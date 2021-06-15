################### Modules Configuration ###########################

module "vpc" {
  source                                 = "./modules/vpc"  
  network_name                           = var.network_name
  project_id                             = var.project_id
  auto_create_subnetworks                = var.auto_create_subnetworks
  routing_mode                           = var.routing_mode
  description_vpc                        = var.description_vpc
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  mtu                                    = var.mtu
  region                                 = var.region
  
}

module "subnet" {
  source                                 = "./modules/subnet"  
  subnet_name                            = var.subnet_name
  ipv4                                   = var.ipv4
  region                                 = var.region
  description_subnet                     = var.description_subnet
  project_id                             = var.project_id
  network_id                             = module.vpc.network_id
}

module "firewall" {
  source                                 = "./modules/firewall"
  project_id                             = var.project_id
  network_id                             = module.vpc.network_id
  rules                                  = var.rules
}

module "compute" {
  source                                 = "./modules/compute"
  tags                                   = var.tags
  instances                              = var.instances
  machine_type                           = var.machine_type
  type                                   = var.type
  size                                   = var.size
  network_id                             = module.vpc.network_id
  subnet_id                              = module.subnet.subnet_id
  project_id                             = var.project_id
  zone                                   = var.zone
  family                                 = var.family
  project                                = var.project
  hostname                               = var.hostname
  startup_script                         = var.hostname
}

module "template_file" {
  source                                 = "./modules/template_file"
  public_ip_template                     = module.compute.instance_public_ip
  private_ip_template                    = module.compute.instance_private_ip
  hostname_template                      = module.compute.hostname
  depends_on                             = [module.compute]
}