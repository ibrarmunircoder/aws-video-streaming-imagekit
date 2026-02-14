output "access_key" {
  value = aws_iam_access_key.imagekit_user_creds.id
}

output "secret_access_key" {
  sensitive = true
  value     = aws_iam_access_key.imagekit_user_creds.secret
}

output "bucket_name" {
    value = aws_s3_bucket.imagekit_travel_videos_origin.id
}