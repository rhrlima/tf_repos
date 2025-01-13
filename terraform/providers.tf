terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "rlima-twbr-iac-tfstate"
    key     = "tf_repos/terraform.tfstate" # unique key per project
    region  = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      managed_by = "terraform"
      project    = "tf_repos"
      owner      = "rlima"
    }
  }
}
