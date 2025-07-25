output "s3_bucket_name" {
  value = aws_s3_bucket.tf_backend.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}

