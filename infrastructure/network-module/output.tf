

output "VPC_id" {
  value = google_compute_network.vpc_network.id
}


output "management_subnet" {
  value = google_compute_subnetwork.management-subnet.id
}

output "management_subnet_cidr" {
 value = google_compute_subnetwork.management-subnet.ip_cidr_range
}


output "workload_subnet" {
  value = google_compute_subnetwork.workload-subnet.id
}

output "project-id" {
  value = var.project_id
}