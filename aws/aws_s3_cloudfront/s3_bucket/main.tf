resource "aws_s3_bucket" "this" {
  count = var.create_bucket ? 1 : 0

  bucket        = var.bucket
  bucket_prefix = var.bucket_prefix

  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = var.create_bucket && var.attach_public_policy ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

data "aws_iam_policy_document" "s3_policy" {
  count = var.create_bucket && var.attach_cloudfront_policy ? 1 : 0
  # Origin Access Controls
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this[0].arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [var.cloudfront_distribution_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "docs" {
  count  = var.create_bucket && var.attach_cloudfront_policy ? 1 : 0
  bucket = aws_s3_bucket.this[0].id
  policy = data.aws_iam_policy_document.s3_policy[0].json
}
