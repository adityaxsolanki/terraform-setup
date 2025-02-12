resource "aws_lb" "solanki_alb" {
  name               = "solanki-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0bd7f844a6a9bdfd6"] # Apna SG ID yaha daalo
  subnets           = ["subnet-0465ab304a71090fc", "subnet-05a48bc15d1352880"] # Dono subnets correct karo

  enable_deletion_protection = false
  tags = {
    Name = "Solanki-ALB"
  }
}

resource "aws_lb_target_group" "solanki_tg" {
  name     = "solanki-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-02c77d3ac1d3aac6c" # Correct VPC ID

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
resource "aws_lb_listener" "solanki_http_listener" {
  load_balancer_arn = aws_lb.solanki_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.solanki_tg.arn
  }
}
   
