variable "backend_bucket_name" {
  type        = string
  description = "S3 bucket for Terraform remote state"
}

variable "backend_state_key" {
  type        = string
  description = "Path for state file in S3"
  default     = "networking/terraform.tfstate"
}

variable "backend_region" {
  type        = string
  default     = "us-east-1"
}

variable "backend_lock_table" {
  type        = string
  default     = "terraform-state-lock"
}
