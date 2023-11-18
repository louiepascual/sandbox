terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}


resource "aws_s3_bucket" "sandbox_bucket" {
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.sandbox_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "sandbox_s3_public_access_block" {
  bucket = aws_s3_bucket.sandbox_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "sandbox_s3_bucket_policy" {
  bucket = aws_s3_bucket.sandbox_bucket.id
  policy = data.aws_iam_policy_document.sandbox_s3_bucket_policy.json
}

data "aws_iam_policy_document" "sandbox_s3_bucket_policy" {
  statement {
    principals {
        type = "*"
        identifiers =["*"]
    }
  
    sid = "PublicReadGetObject"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.sandbox_bucket.arn}/*"]
    effect = "Allow"
  }
}