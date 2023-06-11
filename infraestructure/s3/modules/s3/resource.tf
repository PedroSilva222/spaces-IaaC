
#####################################
# S3 Resources along with properties
#####################################

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-teste"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.bucket_name}"
    }
  )
}

resource "aws_s3_bucket" "bucket_community" {
  bucket = "${var.bucket_name_community}-teste"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.bucket_name_community}"
    }
  )
}