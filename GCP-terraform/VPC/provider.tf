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
  credentials = "key.json"
}

