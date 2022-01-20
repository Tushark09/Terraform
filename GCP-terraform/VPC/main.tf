resource "google_compute_network" "auto-vpc-tf" {
    name = "auto-vpc-tf"
    auto_create_subnetworks = true
}
resource "google_compute_network" "custom-vpc-tf" {
    name = "custom-vpc-tf"
    auto_create_subnetworks = false
}
resource "google_compute_subnetwork"  "sub-asia" {
    name = "sub-asia"
    network = google_compute_network.custom-vpc-tf.id
    ip_cidr_range = "10.128.0.0/24"
    region = "asia-east1"
    private_ip_google_access = true   
}
resource "google_compute_firewall" "allow-tcp" {
    name = "allow-tcp"
    network = google_compute_network.custom-vpc-tf.id
    allow {
    protocol  = "tcp"
    ports     = ["80","22"]
  }      
    source_ranges = ["0.0.0.0/0"]
    priority = 1000
  
}
output "auto" {
    value = google_compute_network.auto-vpc-tf.id
}
output "custom" {
    value = google_compute_network.custom-vpc-tf.id
}
