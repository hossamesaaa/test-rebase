module "network-mod" {
  source = "../network-module"
  firewall-target-tags=var.vm-target_tags
}

