/*
 * File: c:\all important git push\kube-thula\modules\network\vars.tf
 * Project: c:\all important git push\kube-thula\modules\network
 * Created Date: Friday, August 23rd 2019, 11:46:40 am
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */







variable "project" {
  default = "temp-250409"
}

variable "location" {
  default = "asia-southeast1"
}

variable "vpc_name" {
  default = "k8s-vpc"
}

variable "mgmt-sn_ip_range" {
  default = "10.1.20.0/24"
}


variable "pod_address_range" {
  default = "10.12.0.0/14"
}

variable "service_address_range" {
  default = "10.204.0.0/20"
}
variable "app-sn_ip_range" {
  default = "10.1.40.0/23"
}


variable "data-sn_ip_range" {
  default = "10.1.50.0/23"
}

variable "vpn-sn_ip_range" {
  default = "10.1.10.0/23"
}

variable "web-sn_ip_range" {
  default = "10.1.30.0/23"
}

variable "cluster-pods" {
  default = "gke-standard-cluster-pods"
}

variable "cluster-services" {
  default = "gke-standard-cluster-services"
}

variable "rbac_net" {
  default = "bastion"
}
