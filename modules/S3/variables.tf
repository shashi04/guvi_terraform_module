variable "bucket_name" {
  description = "Unique name for the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable or disable versioning"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow bucket deletion even if objects exist"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}
