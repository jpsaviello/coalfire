resource "aws_s3_bucket" "this" {

  force_destroy                        = var.force_destroy
}
