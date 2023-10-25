
resource "google_service_account" "private-vm-sa" {
  account_id   = "sa-private-vm"
  display_name = "Custom SA for VM Instance"
}


resource "google_project_iam_member" "service_account_with-artifact-role" {
  project = var.project_id
  role    = "roles/artifactregistry.repoAdmin"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}


resource "google_project_iam_member" "service_account_with-token-role" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}

resource "google_project_iam_member" "service_account_with-gke-role" {
  project = var.project_id
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}
resource "google_project_iam_member" "service_account_with-gke-developer-role" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}

resource "google_project_iam_member" "service_account_with-gke-admin-role" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}


# To create role,rolebinding 
resource "google_project_iam_member" "service_account_with-gke-create-cluster-role" {
  project = var.project_id
  role    = "roles/gameservices.serviceAgent"
  member  = "serviceAccount:${google_service_account.private-vm-sa.email}"
}

