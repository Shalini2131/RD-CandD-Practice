resource "aws_cloudfront_distribution" "demo-distribution" {
  origin {
    domain_name = "${aws_lb.final-task-alb.dns_name}"
    origin_id = "${aws_lb.final-task-alb.id}"
  }
  
  enabled = true
    default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_lb.final-task-alb.id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
# HTTPS to HTTPS for secure connection
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

   restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    }
}