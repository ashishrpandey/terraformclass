provider "google" {
  credentials = "${file("account.json")}"
  project     = "zeke-241519"
  region      = "asia-south1"
  zone    = "asia-south1-a"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
  }
}
