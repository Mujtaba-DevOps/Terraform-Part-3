resource "aws_s3_bucket" "s3_bucket" {
    bucket = "my-new-terraform-infra-bucket"

 tags = {
    Name = "my-new-terraform-infra-bucket"
  }
}