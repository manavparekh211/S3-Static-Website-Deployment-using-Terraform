output "static-website-url" {
  value = aws_s3_bucket_website_configuration.static-website-config.website_endpoint
}