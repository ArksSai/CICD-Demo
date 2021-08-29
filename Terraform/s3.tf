resource "aws_s3_bucket" "simple-web-app-logs" {
  bucket = "arks-cicd-demo-simple-web-app-logs"
  acl = "private"
}

resource "aws_s3_bucket" "jenkins-config" {
  bucket = "arks-cicd-demo-jenkins-config"
  acl = "private"
}

resource "aws_s3_bucket_object" "jenkins-config" {
  bucket = aws_s3_bucket.jenkins-config.id
  for_each = fileset("jenkins-config/", "*")
  key = each.value
  source = "jenkins-config/${each.value}"
  etag = filemd5("jenkins-config/${each.value}")
}