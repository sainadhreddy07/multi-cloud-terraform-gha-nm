resource "aws_lb" "this" {
  name               = substr("${var.name}-alb", 0, 32)
  load_balancer_type = "application"
  internal           = var.internal
  subnets            = var.subnet_ids
  security_groups    = var.security_group_ids

  tags = merge(var.tags, {
    Name = "${var.name}-alb"
  })
}


resource "aws_lb_target_group" "this" {
  name     = substr("${var.name}-web-tg", 0, 32)
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path    = var.health_check_path
    matcher = var.health_check_matcher
  }

  tags = var.tags
}


resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_id
  port             = var.backend_port
}


resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
