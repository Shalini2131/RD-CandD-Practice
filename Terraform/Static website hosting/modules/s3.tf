provider "aws" {
  region = "${var.aws_region}"
}
# Creating S3 bucket
resource "aws_s3_bucket" "sh-bucket" {
  bucket = "${var.bucket-name}"
  acl = "public-read"
}

#Adding object into the s3 bucket --> index.html
resource "aws_s3_bucket_object" "sh-bucket-obj-1" {
  acl = "public-read"
  bucket = aws_s3_bucket.sh-bucket.id
  key = "index.html"
  source = "html/index.html"
  content_type = "text/html"
}

#Adding object into the s3 bucket --> about.html
resource "aws_s3_bucket_object" "sh-bucket-obj-2" {
  acl = "public-read"
  bucket = aws_s3_bucket.sh-bucket.id
  key = "about.html"
  source = "html/about.html"
  content_type = "text/html"
}
#Allowing public access
resource "aws_s3_bucket_public_access_block" "sh-bucket-access" {
  bucket = aws_s3_bucket.sh-bucket.id
  block_public_acls = false
  block_public_policy = false
}
#Adding bucket policy for reading the bucket objects
resource "aws_s3_bucket_policy" "sh-bucket-policy" {
    bucket = aws_s3_bucket.sh-bucket.id
  policy =jsonencode({
  Version: "2012-10-17",
  Statement: [
    {
      Sid: "PublicReadObjects",
      Action: [
        "s3:GetObject"
      ],
      Effect: "Allow",
      Resource: "arn:aws:s3:::sh-terraform-bucket/*",
      Principal: "*"
    }
  ]
})
}
