terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "tf-state-bucket-backend-134"
    key    = "backend.tfstate"
    region = "ap-south-1"

    # enable locking
    dynamodb_table = "terraform-state-locks"

    encrypt = true
  }
}
