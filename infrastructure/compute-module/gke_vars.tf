

variable "artifact-reg-region" {
  type           = string
  description    = "artifact reg region"
  default        = "asia-south1"
}


variable "artifact-reg-format" {
  type           = string
  description    = "artifact reg format "
  default        = "DOCKER"
}

variable "artifact-reg-repo-name" {
  type           = string
  description    = "artifact reg repo name"
  default        = "docker-repository"
}



#GKE cluster

variable "gke-region" {
  type           = string
  description    = "node-region"
  default        = "us-east5"
  # default        = "us-central1"
}

variable "node-region" {
  type           = string
  description    = "node-region"
  default        = "us-east5"
  # default        = "us-central1"
}


variable "gke_num_nodes" {
  type = number
  default     = 1
  description = "number of gke nodes"
}

variable "node_pool_locations" {
  type           = list(string)
  description    = "node_pool_locations"
  default        = ["us-east5-a"]
}

