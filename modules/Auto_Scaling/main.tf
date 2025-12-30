resource "aws_launch_template" "this" {
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    security_groups = var.security_groups
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity = var.desired
  max_size         = var.max
  min_size         = var.min
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}
