
terraform {
  backend "s3" {
    bucket         = "solanki-bucket-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
resource "aws_security_group_rule" "alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-0bd7f844a6a9bdfd6" # Apna existing SG ID
}
output "solanki_alb_dns_name" {
  value = aws_lb.solanki_alb.dns_name
}
