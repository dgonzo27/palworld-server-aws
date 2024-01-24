terraform {
  backend "s3" {
    bucket = "changeme"
    key    = "state.tfstate"
  }
}
