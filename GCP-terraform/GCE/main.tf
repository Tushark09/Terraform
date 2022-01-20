resource "google_compute_instance" "vm-tf" {
    name = "vm-tf"
    machine_type = "n1-standard-1"
    zone = "asia-east1-a"
    allow_stopping_for_update = true

    network_interface {
      network = "custom-vpc-tf"
      subnetwork = "sub-asia"
    }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size = 20
    }
  }
  labels = {
      "env" = "tflearning"
  }
  /*
  scheduling {
    Preemptible = false
    automatic_restart = false
  }
  */
  service_account {
    email = "service-account.name"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
  
}

  resource "google_compute_attached_disk" "disk1" {
  disk     = google_compute_disk.disk-tf.id
  instance = google_compute_instance.vm-tf.id
}


resource "google_compute_disk" "disk-tf" {
    name= "disk-tf"
    size = 15
    zone = "asia-east1-a"
    type = "pd-ssd"  
}