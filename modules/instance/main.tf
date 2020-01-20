/*
 * File: c:\all important git push\kube-thula\modules\instance\main.tf
 * Project: c:\all important git push\kube-thula\modules\instance
 * Created Date: Tuesday, August 27th 2019, 5:29:56 pm
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */








module "network" {
  source   = "../../modules/network"
}


module "iam" {
  source = "../../modules/iam"
  
}
resource "google_compute_instance" "gke-admin" {
  project = "${var.project}"
  name = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone = "${var.zone}"


  tags = ["allow-all-to-maga","bastion"]

  boot_disk {
    initialize_params {
      image = "${var.image_name}"
    }
  }

service_account {
    email = "${module.iam.email}"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/trace.append","https://www.googleapis.com/auth/cloud-platform"]
  }

metadata_startup_script=<<SCRIPT
${file("startup.sh")}
SCRIPT

network_interface {
    subnetwork = "${module.network.subnet_self_link_1}"
    access_config {
    }
  }
}
