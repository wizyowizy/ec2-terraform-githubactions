variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
  default     = "wizyowizy-onyinye-onyejiaka-2025"
}
