
provider "google" {
  project = var.project_id
  # region  = var.vpc-region
  credentials=var.sv-key

}
