# Declarative approach: Let the earth be like this. 

# We need a certain provider, which is google
terraform {
    required_providers {
      
      google = {
        source = "hashicorp/google"
        version = "~> 5.0"
      }
    }  
}

provider "google" {
    project = "my-own-project-1-451009" # Own project ID
    region = "us-west1"
}

# We give the bucket a name and create Google Cloud Storage bucket
resource "google_storage_bucket" "mybucket" {
    name = "my-terraform-bucket-999998999" # Ensure unique ID
    location = "us-west1"

  versioning {
    enabled = true
  }

  labels = {
    environment = "student-lab"
    managed_by = "terraform"
  }
}

# Define a output variable bucket_name
output "bucket_name" {
    value = google_storage_bucket.mybucket.name
}