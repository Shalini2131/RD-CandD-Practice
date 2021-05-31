#Creating ALB
resource "aws_alb" "my-alb" {
  name = "my-alb"
  load_balancer_type = "application"
  security_groups = [ aws_security_group.terraform_http_sg.id, aws_security_group.terraform_ssh_sg.id ]
  subnets = [ aws_subnet.tf-public-subnet_1.id, aws_subnet.tf-public-subnet_2.id]
}

#Creating target groups
resource "aws_alb_target_group" "tf-red-tg" {
  name = "tf-red-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform-vpc.id
  health_check {
    path                = "/red/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    }
}

resource "aws_alb_target_group" "tf-yellow-tg" {
  name = "tf-yellow-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform-vpc.id
  health_check {
    path                = "/yellow/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    }
}

resource "aws_alb_target_group" "tf-blue-tg" {
  name = "tf-blue-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform-vpc.id
  health_check {
    path                = "/blue/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    }
}

resource "aws_alb_target_group" "tf-default-tg" {
  name = "tf-default-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform-vpc.id
  health_check {
    path                = "/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    }
}
#Creating Listener
resource "aws_alb_listener" "my-alb-listener" {
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.tf-default-tg.arn
  }
  load_balancer_arn = aws_alb.my-alb.arn
  port = 80
  protocol = "HTTP"
}

#Craeting listener rules
resource "aws_alb_listener_rule" "default-rule" {
  action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "The path must be either /red/, /blue/ or /yellow/"
      status_code = "200"
    }
  }
     condition {
    query_string {
      key   = "health"
      value = "check"
    }

    query_string {
      value = "bar"
    }
  }
  listener_arn = aws_alb_listener.my-alb-listener.arn
}
resource "aws_alb_listener_rule" "red" {
  action {
    target_group_arn = aws_alb_target_group.tf-red-tg.arn
    type="forward"
  }
  condition {
    path_pattern {
      values =["/red/"]
    }
  }
  listener_arn = aws_alb_listener.my-alb-listener.arn
  
}

resource "aws_alb_listener_rule" "yellow" {
  action {
    target_group_arn = aws_alb_target_group.tf-yellow-tg.arn
    type="forward"
  }
  condition {
    path_pattern {
      values =["/yellow/"]
    }
  }
  listener_arn = aws_alb_listener.my-alb-listener.arn
  
}

resource "aws_alb_listener_rule" "blue" {
  action {
    target_group_arn = aws_alb_target_group.tf-blue-tg.arn
    type="forward"
  }
  condition {
    path_pattern {
      values =["/blue/"]
    }
  }
  listener_arn = aws_alb_listener.my-alb-listener.arn
  
}

# creating attachments
resource "aws_alb_target_group_attachment" "default-atch" {
  target_group_arn = aws_alb_target_group.tf-default-tg.arn
  target_id = aws_instance.alb-instance.id
  port = 80
}
resource "aws_alb_target_group_attachment" "red-atch" {
  target_group_arn = aws_alb_target_group.tf-red-tg.arn
  target_id = aws_instance.alb-instance.id
  port = 80
}

resource "aws_lb_target_group_attachment" "yellow-atch" {
  target_group_arn = aws_alb_target_group.tf-yellow-tg.arn
  target_id = aws_instance.alb-instance.id
  port = 80
}

resource "aws_lb_target_group_attachment" "blue-atch" {
  target_group_arn = aws_alb_target_group.tf-blue-tg.arn
  target_id = aws_instance.alb-instance.id
  port = 80
}