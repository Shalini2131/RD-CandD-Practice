locals {
  traffic_dist_map = {
    blue = {
      blue  = 100
      green = 0
    }
    blue-90 = {
      blue  = 90
      green = 10
    }
    split = {
      blue  = 50
      green = 50
    }
    green-90 = {
      blue  = 10
      green = 90
    }
    green = {
      blue  = 0
      green = 100
    }
  }
}

resource "aws_lb" "final-task-alb" {
  name               = "final-task-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  subnets            = module.vpc.public_subnets
  internal           = false
}

resource "aws_lb_target_group" "blue" {
  name     = "blue-tg-blue-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "green" {
  name     = "green-tg-green-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "blue" {
  target_group_arn = aws_lb_target_group.blue.arn
  target_id        = aws_instance.blue[0].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "green" {
  target_group_arn = aws_lb_target_group.green.arn
  target_id        = aws_instance.green[0].id
  port             = 80
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.final-task-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }
      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }
      #   stickiness {
      #     enabled  = false
      #     duration = 1
      #   }
    }
  }
}