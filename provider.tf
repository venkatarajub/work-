terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.70.0"
    }
  }
   backend "s3" {
    bucket         = "ven-remote-state"
    key            = "ven-state-demo"
    region         = "us-east-1"
    dynamodb_table = "ven-locking"
  }
  
}

provider "aws" {
  # Configuration options
}