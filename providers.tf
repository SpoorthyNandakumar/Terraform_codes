terraform {
  #required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region  = "ap-south-1"
  profile = "Spoorthy"
  access_key = var.access_key
  secret_key = var.secret_key
    assume_role {
    role_arn = "arn:aws:iam::792820380616:role/sample_1"
  }
}
  
