resource "aws_s3_bucket" "this" {

  force_destroy                        = var.force_destroy

}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
    bucket = aws_s3_bucket.this.id
rule {
 
    id      = "log"
    status = "Enabled"
    prefix  = "Logs/"

    expiration {
      days = 90
    }
    

}

rule {
 
    id      = "images"
    status = "Enabled"
    prefix  = "Images/"

    transition {
        days = 90
        storage_class = "GLACIER"
    }

}
}
