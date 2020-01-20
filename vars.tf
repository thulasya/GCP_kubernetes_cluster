/*
 * File: c:\all important git push\kube-thula\vars.tf
 * Project: c:\all important git push\kube-thula
 * Created Date: Friday, August 23rd 2019, 1:41:16 pm
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


variable "cluster_name" {
  default = "pickme-standard-cluster2"
}

variable "cluster-pods" {
  default = "gke-standard-cluster-pods"
}

variable "cluster-services" {
  default = "gke-standard-cluster-services"
}

variable "initial_node_count" {
  default = "3"
}

variable "node_pool_name" {
  default = "my-node-pool"
}

variable "node_pool_node_count" {
  default = "1"
}

variable "node_pool_version" {
  default = "1.13.7-gke.24"
}

variable "machine_type" {
  default = "n1-standard-1"
}


variable "gke_authnetwork_auditor" {
  default = "34.87.60.170/32"
}

variable "gke_authnetwork_owner" {
  default = "35.197.159.134/32"
}

variable "gke_authnetwork_admin" {
  default = "35.240.234.239/32"
}

