resource "local_file" "ansible_inventory" {
  
  content                   = templatefile("${path.module}/templates/invetory.tpl",
  {

  #Master Node Configuration
  K8S_MASTER_NODE_IP        = element(flatten(var.private_ip_template),0)
  hostname_master           = element(var.hostname_template, 0)
  K8S_MASTER_NODE_PUBLIC_IP = element(flatten(var.public_ip_template), 0)

  #Worker Node Configurationcd 
  hostname_worker           = var.hostname_template
  K8S_WORKER_NODE_PUBLIC_IP = flatten(var.public_ip_template)

  })
  filename                  = "${path.root}/../Ansible/hosts"
}

