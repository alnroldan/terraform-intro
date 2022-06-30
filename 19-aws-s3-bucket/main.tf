resource "aws_s3_bucket" "s3-bucket-aws" {
    bucket = "aroldanbs3"
    tags = {
        Description = "bucket s3 sample"
    }
}