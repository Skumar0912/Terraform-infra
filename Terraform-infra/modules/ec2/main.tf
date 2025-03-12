resource "aws_launch_template" "app" {
  name_prefix   = "app"
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
  vpc_zone_identifier = var.subnets
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}
