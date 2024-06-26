variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.gcp_project_id}-gke"
  location = var.gcp_region
 
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
 
  enable_autopilot = true
}
