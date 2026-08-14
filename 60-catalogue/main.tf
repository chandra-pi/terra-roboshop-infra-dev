resource "aws_lb_target_group" "catalogue" {
    name     = "${var.project}-${var.environment}-catalogue"  ## roboshop-dev-catalogue
    port     = 8080
    protocol = "HTTP"
    vpc_id   = local.vpc_id
}