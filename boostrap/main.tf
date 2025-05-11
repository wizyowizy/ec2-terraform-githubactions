
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}



##bootstrap/variables.tf

variable "region" {
  default = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the bucket for storing tfstate"
}


###bootstrap/terraform.tfvars

bucket_name = "realcloud-tfstate-bucket-001"
