/*
 * File: c:\all important git push\kube-thula\modules\instance\outputs.tf
 * Project: c:\all important git push\kube-thula\modules\instance
 * Created Date: Wednesday, August 28th 2019, 1:08:16 am
 * Author: Thulasya Rajakaruna
 * -----
 * Copyright (c) 2019 Thulasya Rajakaruna
 */








output "network_self_link" {
  value = "${module.network.network_self_link}"
}
output "subnet_self_link_1" {
  value = "${module.network.subnet_self_link_1}"
}

