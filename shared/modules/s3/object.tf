resource "aws_s3_object" "main" {
  bucket = aws_s3_bucket.main.id
  count  = length(var.objects)

  key    = element(var.objects.*.key, count.index)
  source = element(var.objects.*.source, count.index)
}
