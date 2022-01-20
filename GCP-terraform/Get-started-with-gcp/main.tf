terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "project-name"
  region = "us-east1"
  zone = "us-east1-a"
}

resource google_storage_bucket "GCS2"{
  name = "bucket-name"
  location      = "US"
  storage_class = "STANDARD"
}