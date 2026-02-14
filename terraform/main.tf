

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "imagekit_travel_videos_origin" {
  bucket = "imagekit-travel-videos-origin-${random_string.suffix.result}"
  # enabled only for this demo
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.imagekit_travel_videos_origin.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "travel_videos" {
  bucket   = aws_s3_bucket.imagekit_travel_videos_origin.id
  for_each = fileset("${path.module}/../videos", "**/*")
  key      = each.value
  source   = "${path.module}/../videos/${each.value}"
  etag     = filemd5("${path.module}/../videos/${each.value}")
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "json" = "application/json",
    "png"  = "image/png",
    "jpg"  = "image/jpeg",
    "jpeg" = "image/jpeg",
    "gif"  = "image/gif",
    "svg"  = "image/svg+xml",
    "ico"  = "image/x-icon",
    "txt"  = "text/plain"
    "mp4"  = "video/mp4"
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}


resource "aws_iam_user" "imagekit_user" {
  name = "imagekit-user"
  path = "/imagekit/"
}



resource "aws_iam_policy" "imagekit_s3_read_only_policy" {
  name = "ImagekitReadOnlyS3Policy"
  path = "/imagekit/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject*",
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.imagekit_travel_videos_origin.arn}/*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.imagekit_user.name
  policy_arn = aws_iam_policy.imagekit_s3_read_only_policy.arn
}



resource "aws_iam_access_key" "imagekit_user_creds" {
  user = aws_iam_user.imagekit_user.name
}