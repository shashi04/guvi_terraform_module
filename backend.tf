terraform {
  required_version = ">= 1.5.0"

  backend "s3" {  # For Remoate State Management
    bucket         = "my-terraform-state-bucket"
    key            = "project/${terraform.workspace}/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
