output "bucketname" {
  value = "${aws_s3_bucket.ashish_bucket[*].id}"
}
