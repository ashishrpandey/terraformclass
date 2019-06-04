provider "google" {
  credentials = "${file("account.json")}"
  project     = "zeke-241519"
  region      = "asia-south1"
  zone    = "asia-south1-a"
}
resource "google_storage_bucket" "image-store" {
  name     = "image-store-bucket-ashish426"
  location = "EU"

}
