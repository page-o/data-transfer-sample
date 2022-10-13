terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "sample-tfstate-bucket"
    key            = "sample.tfstate"
    dynamodb_table = "sample-tfstate-table"
    region         = "ap-northeast-1"
  }
}
