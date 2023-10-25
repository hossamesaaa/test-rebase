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


variable "management_subnet_cidr_range" {
  type           = string
  description    = "management_subnet_cidr"
  default        = "10.1.0.0/16"
}

variable "management_subnet_region" {
  type           = string
  description    = "management_subnet_region"
  default        = "us-south1"
  # default        = "us-east1"
}



variable "workload_subnet_cidr_range" {
  type           = string
  description    = "workload_subnet_cidr"
  default        = "192.168.1.0/24"
}

variable "workload_subnet_region" {
  type           = string
  description    = "workload_subnet_region"
  default        = "us-east5"
  # default        = "us-central1"
}


variable "firewall-protocol" {
  type           = string
  description    = "firewall-protocol"
  default        = "tcp"
}

variable "firewall-ports" {
  type           = list(string)
  description    = "firewall-ports"
  default        = ["22"]
}



variable "firewall-target-tags" {
  type           = list(string)
  description    = "firewall-target-tags"
  default        = ["web"]
}

variable "firewall-source-ranges" {
  type           = list(string)
  description    = "firewall-source-ranges"
  # default        = ["22"]
  # allow IAP obly to access VM
  default        = ["35.235.240.0/20"]

}

