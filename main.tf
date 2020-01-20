/*
 * File: c:\all important git push\kube-thula\main.tf
 * Project: c:\all important git push\kube-thula
 * Created Date: Friday, August 23rd 2019, 11:46:40 am
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */







provider "google" {
  credentials = "${file("./creds/temp-250409-f6ca481c18a5.json")}"
  project     = "${var.project}"
  region      = "${var.location}"
}

module "instance" {
  source = "./modules/instance"
  
}

resource "google_container_cluster" "primary" {

  name     = "${var.cluster_name}"
  location = "${var.location}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  
  remove_default_node_pool = true
  initial_node_count = "${var.initial_node_count}"
  network    = "${module.instance.network_self_link}" 
  subnetwork = "${module.instance.subnet_self_link_1}"
  ip_allocation_policy {
    #create_subnetwork = true
   cluster_secondary_range_name  = "${var.cluster-pods}"
   services_secondary_range_name = "${var.cluster-services}"
  }

  min_master_version = "1.13.7"
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${var.gke_authnetwork_auditor}"
      display_name = "gke-authnetwork-auditor"
    }
    cidr_blocks {
      cidr_block = "${var.gke_authnetwork_owner}"
      display_name = "gke-authnetwork-owner"
    }
    cidr_blocks {
      cidr_block = "${var.gke_authnetwork_admin}"
      display_name = "gke-authnetwork-admin"
    }  
  }
}


#This will create the custom node pool 
resource "google_container_node_pool" "primary_preemptible_nodes" {

  name       = "${var.node_pool_name}"
  location   = "${var.location}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = "${var.node_pool_node_count}"
  version       = "${var.node_pool_version}"
  management {
      auto_upgrade = true
      auto_repair  = true
    }
  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloud-platform"

    ]
  }
}

