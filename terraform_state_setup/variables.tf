variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket for Terraform State"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB Table for State Locking"
  type        = string
}