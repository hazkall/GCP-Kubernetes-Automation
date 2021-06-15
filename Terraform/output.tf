#Outputs to the user
output "GCP"{

value = [for x in range(var.instances) :

        "Name = ${element(module.compute.hostname, x)}\nPrivate_IP = ${element(flatten(module.compute.instance_private_ip), x)}\nPublic_IP = ${element(flatten(module.compute.instance_public_ip), x)}"
        
        ] 
  
}