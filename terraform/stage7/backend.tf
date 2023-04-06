terraform {
  backend "gcs" {
    bucket      = "gcpuser10-codegarage-terraform-state-stage6demo"
    prefix      = "terraform/state"
    credentials = "../../credentials.json"
  }
}