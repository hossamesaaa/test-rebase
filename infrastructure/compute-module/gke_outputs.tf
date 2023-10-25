
output "artifact-repo-url" {
  value = "${google_artifact_registry_repository.docker-repo.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker-repo.repository_id}"

}

