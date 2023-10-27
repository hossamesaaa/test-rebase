master_authorized_networks_config {
    cidr_blocks {
      display_name = "My Management Subnet"
      cidr_block   = module.network-mod.management_subnet_cidr
    }
     cidr_blocks {
      display_name = "My_ip"
      cidr_block   = "196.157.99.41/32"
    }