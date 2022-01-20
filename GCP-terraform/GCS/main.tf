resource "google_storage_bucket" "GCS4" {
  name = "tf_bucket_from_terraform_bio1"
  storage_class = "STANDARD"
  location = "US"
  uniform_bucket_level_access = false
  labels = {
    "env" = "terraform"
    "dep" = "rnd"
  }
}

resource "google_storage_bucket_object" "picture" {
  name = "dog_logo"
  source = "dog.jpg"
  bucket = google_storage_bucket.GCS4.name 
}

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.picture.name
  bucket = google_storage_bucket.GCS4.name
  role = "READER"
  entity = "allUsers" 
}