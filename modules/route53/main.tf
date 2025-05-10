data "aws_route53_zone" "myzone" {
  name         = var.HOSTED_ZONE_NAME
  private_zone = false
}
