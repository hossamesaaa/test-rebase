resource "google_compute_firewall" "allow-ingress-private-vm" {
  project     = var.project_id
  name        = "my-ssh-firewall"
  network     = google_compute_network.vpc_network.id
  direction   = "INGRESS"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = var.firewall-protocol
    ports     = var.firewall-ports
  }

  target_tags = var.firewall-target-tags
  source_ranges= var.firewall-source-ranges

}