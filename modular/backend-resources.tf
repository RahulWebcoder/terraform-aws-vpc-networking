resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "devops-tfstate-rahul-demo"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "terraform-state-bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_lock_table" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-table"
  }
}
