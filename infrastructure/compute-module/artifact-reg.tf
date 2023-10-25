resource "google_artifact_registry_repository" "docker-repo" {
  location      = var.artifact-reg-region
  project       = var.project_id 
  repository_id = var.artifact-reg-repo-name
  description   = "docker repository"
  format        = var.artifact-reg-format
  mode           ="STANDARD_REPOSITORY"
}