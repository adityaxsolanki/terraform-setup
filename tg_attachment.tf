resource "aws_lb_target_group_attachment" "solanki_tg_attachment" {
  target_group_arn = aws_lb_target_group.solanki_tg.arn
  target_id        = "i-0f43ff92ce463bda6" # Running EC2 instance ID
  port            = 80
}
