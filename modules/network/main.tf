/*
 * File: c:\all important git push\kube-thula\modules\network\main.tf
 * Project: c:\all important git push\kube-thula\modules\network
 * Created Date: Friday, August 23rd 2019, 11:46:40 am
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */









provider "google" {
  project     = "${var.project}"
  region      = "${var.location}"
}


// A network to hold just the GKE cluster, not recommended for other instances.
resource "google_compute_network" "gke-network" {
  name                    = "${var.vpc_name}"
  auto_create_subnetworks = false
  provider                = "google"
}

// Subnetwork for the GKE cluster.
resource "google_compute_subnetwork" "cluster-subnet-1" {
  name          = "mgmt-sn"
  ip_cidr_range = "${var.mgmt-sn_ip_range}"
  network       = "${google_compute_network.gke-network.self_link}"
  provider      = "google"

  // A named secondary range is mandatory for a private cluster, this creates it.
  secondary_ip_range {
    range_name    = "${var.cluster-pods}"
    ip_cidr_range = "${var.pod_address_range}"
    #ip_cidr_range = "10.12.0.0/14"
  }
  secondary_ip_range {
    range_name    = "${var.cluster-services}"
    ip_cidr_range = "${var.service_address_range}"
    #ip_cidr_range = "10.204.0.0/20"
  }
}

resource "google_compute_subnetwork" "cluster-subnet-2" {
  name          = "app-sn"
  ip_cidr_range = "${var.app-sn_ip_range}"
  network       = "${google_compute_network.gke-network.self_link}"
  provider      = "google"
}

resource "google_compute_subnetwork" "cluster-subnet-3" {
  name          = "data-sn"
  ip_cidr_range = "${var.data-sn_ip_range}"
  network       = "${google_compute_network.gke-network.self_link}"
  provider      = "google"
}

resource "google_compute_subnetwork" "cluster-subnet-4" {
  name          = "vpn-sn"
  ip_cidr_range = "${var.vpn-sn_ip_range}"
  network       = "${google_compute_network.gke-network.self_link}"
  provider      = "google"
}

resource "google_compute_subnetwork" "cluster-subnet-5" {
  name          = "web-sn"
  ip_cidr_range = "${var.web-sn_ip_range}"
  network       = "${google_compute_network.gke-network.self_link}"
  provider      = "google"
}


############# firewall creating ###################

resource "google_compute_firewall" "allow-ssh-fw-rule" {
  name          = "gke-demo-bastion-fw-rbac"
  network       = "${google_compute_network.gke-network.self_link}"
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  provider      = "google"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["${var.rbac_net}"]
}

resource "google_compute_firewall" "allow-all-to-maga" {
  name          = "allow-all-to-maga"
  network       = "${google_compute_network.gke-network.self_link}"
  direction     = "INGRESS"

  source_ranges = ["122.255.58.170","220.247.216.82"]
  provider      = "google"
  allow {
    protocol = "tcp"
    ports    = ["22-22000"]
  }
    allow {
    protocol = "icmp"
  }

}

resource "google_compute_firewall" "allow-internal-network-fw-rule" {
  name          = "allow-internal-network-fw-rule"
  network       = "${google_compute_network.gke-network.self_link}"
  direction     = "INGRESS"
  source_ranges = ["10.120.0.0/16"]
  provider      = "google"
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "loadbalancer-firewall-healthcheck" {
  name          = "loadbalancer-firewall-healthcheck"
  network       = "${google_compute_network.gke-network.self_link}"
  direction     = "INGRESS"
  source_ranges = ["130.211.0.0/22","35.191.0.0/16"]
  provider      = "google"
  allow {
    protocol = "all"
  }
}