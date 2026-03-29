resource "aws_s3_bucket" "mybucket" {
  bucket = "abra-ka-dabra-state-bucket"

  tags = {
    Name        = "abra-ka-dabra-state-bucket"
    Environment = "test"
  }
}
