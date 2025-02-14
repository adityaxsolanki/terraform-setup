resource "aws_launch_template" "solanki_lt" {
  name_prefix   = "solanki-lt-"
  image_id      = "ami-0e1bed4f06a3b463d"  # ✅ Ubuntu 22.04 AMI
  instance_type = "t2.micro"  # ✅ Free-tier instance

  vpc_security_group_ids = ["sg-0bd7f844a6a9bdfd6"]  # ✅ Security Group

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "solanki-asg-instance"
    }
  }
}

resource "aws_autoscaling_group" "solanki_asg" {
  name                      = "solanki-auto-scaling-group"
  desired_capacity          = 2  # ✅ ASG will start with 2 instances
  min_size                  = 1  # ✅ Minimum 1 instance should always run
  max_size                  = 3  # ✅ Maximum 3 instances allowed
  health_check_type         = "EC2"  # ✅ Basic health check

  vpc_zone_identifier       = ["subnet-0d19d4d80d874a7c1", "subnet-05a48bc15d1352880"]  # ✅ Public subnets

  launch_template {
    id      = aws_launch_template.solanki_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "solanki-asg-instance"
    propagate_at_launch = true
  }
}
