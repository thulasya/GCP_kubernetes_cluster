/*
 * File: c:\all important git push\kube-thula\modules\iam\main.tf
 * Project: c:\all important git push\kube-thula\modules\iam
 * Created Date: Monday, August 26th 2019, 4:20:56 pm
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */









provider "google" {
  #credentials = "${file("./creds/temp-250409-f6ca481c18a5.json")}"
  project     = "${var.project}"
  region      = "${var.location}"
}

resource "google_service_account" "storage_user" {
  account_id   = "${var.storage_user}"
  display_name = "${var.storage_user}"
}


resource "google_project_iam_member" "storage_user" {
  project = "${var.project}"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.storage_user.email}"
}

resource "google_storage_bucket" "k8s-app-configs" {
  name     = "${var.storage_bucket}"
  storage_class = "REGIONAL"
  location = "${var.location}"

}

/*resource "google_storage_bucket_iam_member" "member" {
  bucket = "${google_storage_bucket.k8s-app-configs.name}"
  role    = "roles/storage.admin"
  member      = "${google_service_account.storage_user.email}"
  provider      = "google"
}*/

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = "${google_storage_bucket.k8s-app-configs.name}"
  role        = "roles/storage.admin"
  provider      = "google"
  members = [
    "serviceAccount:${google_service_account.storage_user.email}",
  ]
}


resource "google_service_account" "gke_admin_rbac" {
  account_id   = "${var.gke_admin_rbac}"
  display_name = "${var.gke_admin_rbac}"
}


resource "google_project_iam_member" "gke_admin_rbac" {
  project = "${var.project}"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.gke_admin_rbac.email}"
}