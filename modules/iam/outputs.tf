/*
 * File: c:\all important git push\kube-thula\modules\iam\outputs.tf
 * Project: c:\all important git push\kube-thula\modules\iam
 * Created Date: Tuesday, August 27th 2019, 6:08:03 pm
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */









output "email" {
    value = "${google_service_account.gke_admin_rbac.email}"
}