/*
 * File: c:\all important git push\kube-thula\modules\iam\vars.tf
 * Project: c:\all important git push\kube-thula\modules\iam
 * Created Date: Monday, August 26th 2019, 5:05:19 pm
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

variable "storage_user" {
  default = "gke-storage-config-reader"
}

variable "storage_bucket" {
  default = "k8s-app-configs_temp"
}
variable "gke_admin_rbac" {
  default = "gke-admin-rbac"
}