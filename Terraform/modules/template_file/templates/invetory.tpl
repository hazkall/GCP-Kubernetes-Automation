
[k8s-masters]
ansible_host=${hostname_master} ansible_ssh_host=${K8S_MASTER_NODE_PUBLIC_IP}

[k8s-workers]
%{ for x in range(1, length(K8S_WORKER_NODE_PUBLIC_IP)) ~}
ansible_host=${hostname_worker[x]} ansible_ssh_host=${K8S_WORKER_NODE_PUBLIC_IP[x]}
%{ endfor ~}

[kubernetes:children]
k8s-masters
k8s-workers

[kubernetes:vars]
K8S_MASTER_NODE=${hostname_master}
K8S_API_SECURE_PORT=6443
