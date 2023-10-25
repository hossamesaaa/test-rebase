

resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
  display_name = "Custom SA for gke "
}


resource "google_project_iam_member" "service_account_with-gke-role1" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}


resource "google_project_iam_member" "service_account_with-gke-role2" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "service_account_with-gke-role3" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}


resource "google_project_iam_member" "service_account_with-gke-role4" {
  project = var.project_id
  role    = "roles/stackdriver.resourceMetadata.writer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "service_account_with-gke-role5" {
  project = var.project_id
  role    = "roles/autoscaling.metricsWriter"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "service_account_with-gke-role6" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

