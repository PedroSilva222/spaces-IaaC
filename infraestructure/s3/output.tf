########################
# Upload Bucket Outputs
########################

output "bucket_name" {
  value             = module.bucket.bucket_name
  description       = "Upload Bucket name"
}

output "bucket_arn" {
  value             = module.bucket.bucket_arn
  description       = "Upload Bucket arn"
}