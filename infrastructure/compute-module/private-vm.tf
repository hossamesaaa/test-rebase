
resource "google_compute_instance" "private-vm" {
  name         = "my-instance"
  machine_type = var.private_vm_machine_type
  zone         = var.vm-zone  
#   provisioning_model = "STANDARD"
  tags = var.vm-target_tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size="10"
      labels = {
        disk = "private-vm-disk"
      }
    }
  }


  network_interface {
    network = module.network-mod.VPC_id
    subnetwork=module.network-mod.management_subnet
    # subnetwork=module.network-mod.workload_subnet
  }

  metadata = {
    name = "private-vm"
  }
  
  
  # provisioner "file" {
  #   source  = "startup-script.sh"  # local public key
  #   destination  = "/tmp/startup-script.sh"  # will copy to remote VM as /tmp/test.pub

  #  connection {
  #     host        = self.name
  #     type        = "ssh"
  #     user        = "hossam"
  #     private_key = file("path/to/your/private/key")
  #     bastion_host = "iap.googleapis.com"
  #     bastion_user = "create-vpc-vm@hossam-eissa-project.iam.gserviceaccount.com"
  #     bastion_private_key = file("mykey.json")
  #     bastion_port = 22
  #   }

  # }

  metadata_startup_script ="${file("startup-script.sh")}"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.private-vm-sa.email
    scopes = ["cloud-platform"]
    
  }
}

