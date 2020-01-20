/*
 * File: c:\all important git push\kube-thula\modules\instance\vars.tf
 * Project: c:\all important git push\kube-thula\modules\instance
 * Created Date: Tuesday, August 27th 2019, 5:30:33 pm
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */








variable "project" {
  default = "temp-250409"
}

variable "zone" {
  default = "asia-southeast1-b"
}
variable "instance_name" {
  default = "gke-admin2"
}
variable "machine_type" {
  default = "n1-standard-1"
}
variable "image_name" {
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}
variable "startup_script" {
  default= "startup.sh"
}

variable "network" {
  default = "mgmt-sn"
}
variable "email" {
  default = "gke-admin-rbac@temp-250409.iam.gserviceaccount.com"
}
