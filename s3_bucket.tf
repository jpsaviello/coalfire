resource "aws_s3_bucket" "bucket" {
bucket = "bucket"
lifecycle_rule {
  id = "log_retention"
prefix = "logs/"
enabled = true
        expiration {
            days = 90
}

}

}

resource "aws_s3_bucket" "perm_bucket_name" {
    bucket  = "perm_bucket_name"
    acl     = "private"
    lifecycle_rule {
        id      = "permanent_retention"
        enabled = true
        prefix  = "permanent/"

        transition {
            days            = 60
            storage_class   = "GLACIER"
        }
    }
}