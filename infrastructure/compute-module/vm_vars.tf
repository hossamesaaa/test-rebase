variable "project_id" {
  type           = string
  description    = "Project ID"
  default        = "hossam-eissa-project"
}

# variable "vpc-region" {
#   type           = string
#   description    = "Region for this infrastructure"
#   default        = "us-east1"
# }

variable "sv-key" {
  type           = string
  description  = "service account key"
  default       = "mykey.json"
}



variable "private_vm_machine_type" {
  type           = string
  description    = "private vm machine type"
  default        = "n2-standard-2"
}

variable "vm-zone" {
  type           = string
  description    = "vm zone"
  default        = "us-south1-a"
  # default        = "us-east1-b"
}

variable "vm-target_tags" {
  type           = list(string)
  description    = "vm target tags"
  default        = ["private-vm"]
}


