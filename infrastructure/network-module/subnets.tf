
resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.management_subnet_cidr_range
  region        = var.management_subnet_region
  network       = google_compute_network.vpc_network.id
 
}


resource "google_compute_subnetwork" "workload-subnet" {
  name          = "workload-subnet"
  ip_cidr_range = var.workload_subnet_cidr_range
  region        = var.workload_subnet_region
  network       = google_compute_network.vpc_network.id
 
}