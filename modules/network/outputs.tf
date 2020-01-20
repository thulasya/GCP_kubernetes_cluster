/*
 * File: c:\all important git push\kube-thula\modules\network\outputs.tf
 * Project: c:\all important git push\kube-thula\modules\network
 * Created Date: Friday, August 23rd 2019, 11:46:40 am
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */







output "network_self_link" {
  value = "${google_compute_network.gke-network.self_link}"
}

output "vpc_name" {
  value = "${google_compute_network.gke-network.name}"
}


// subnet_self_link can be used to reference the network created by this module
output "subnet_self_link_1" {
  value = "${google_compute_subnetwork.cluster-subnet-1.self_link}"
}



