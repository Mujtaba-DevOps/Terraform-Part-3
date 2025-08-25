terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
  # This is for terraform state backend
  /*
  backend "s3"{
    bucket = "my-new-terraform-infra-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "my-terraform-infra-table"
    user_lockfile = true
  }
  */
  
}