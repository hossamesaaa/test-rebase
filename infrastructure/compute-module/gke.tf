

# GKE cluster
data "google_container_engine_versions" "gke_version" {
  location = var.node-region
  version_prefix = "1.27."
}


resource "google_container_cluster" "project_gke_cluster" {
  name     = "${var.project_id}-gke"
  location = var.gke-region 
               
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
 
  remove_default_node_pool = true
  initial_node_count       = 1
  
  network    = module.network-mod.VPC_id
  subnetwork = module.network-mod.workload_subnet

  deletion_protection= false 

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes = true
    master_ipv4_cidr_block = "192.168.2.0/28"

    master_global_access_config {  # first create without this block, then add
      enabled = true
    }

  }

  master_authorized_networks_config {
    cidr_blocks {
      display_name = "My Management Subnet"
      cidr_block   = module.network-mod.management_subnet_cidr
    }
     cidr_blocks {
      display_name = "My_ip"
      cidr_block   = "0.0.0.0/32"
    }

    #  gcp_public_cidrs_access_enabled = false
  }
 
  
}


# Separately Managed Node Pool
resource "google_container_node_pool" "project_gke_nodes" {

  name       = google_container_cluster.project_gke_cluster.name
  location   = var.node-region

  cluster    = google_container_cluster.project_gke_cluster.name
  version    = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]

  node_count = var.gke_num_nodes
  node_locations=var.node_pool_locations


  node_config {
    service_account = google_service_account.gke_service_account.email
    
    oauth_scopes = [
       "https://www.googleapis.com/auth/cloud-platform"
      # "https://www.googleapis.com/auth/logging.write",
      # "https://www.googleapis.com/auth/monitoring",
    ]


    labels = {
      env = var.project_id
    } 
   

    machine_type = "t2d-standard-1"#"n1-standard-1"
    disk_size_gb = 10
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

