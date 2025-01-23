locals {
  tags = merge(var.tags, { ManagedBy = "Terraform", Purpose = "Testing" })
}

# Create S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${lower(var.environment)}-${lower(var.app_name)}"
  acl    = "private"
  versioning {
    enabled = true
  }
  # Tags
  tags = local.tags
}

output "s3-bucket-name" {
  value = aws_s3_bucket.bucket.id
}
