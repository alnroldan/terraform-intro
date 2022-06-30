resource "aws_s3_bucket" "s3-bucket-aws" {
    bucket = "aroldanbs3"
    tags = {
        Description = "bucket s3 sample"
    }
}

resource "aws_s3_bucket_object" "s3-bucket-files"{
    content = "./attachment/TemarioTerraform.docx"
    key = "TemarioTerraform.docx"
    bucket = aws_s3_bucket.s3-bucket-aws.id
}

resource "aws_s3_object" "s3-bucket-files-2"{
    content = "./attachment/AVReceiver.jpg"
    key = "AVReceiver.jpg"
    bucket = aws_s3_bucket.s3-bucket-aws.id

}
