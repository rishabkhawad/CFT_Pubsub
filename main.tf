terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}


resource "google_pubsub_topic" "topic" {
  name = "testtopic1"
}

resource "google_pubsub_topic" "topic2" {
  name = "testtopic2"
}


resource "google_pubsub_subscription" "my-pubsub-subscription" {
  name  = "my-pubsub-subscription"
  topic = google_pubsub_topic.topic.id
}

