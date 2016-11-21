resource "aws_s3_bucket" "general" {
  bucket = "com.orbit-sys.simple.general"
  acl = "private"
}
resource "aws_s3_bucket" "logs" {
  bucket = "com.orbit-sys.simple.logs"
  acl = "private"
}
resource "aws_s3_bucket" "release" {
  bucket = "com.orbit-sys.simple.release"
  acl = "private"
  versioning { enabled = true }
}
