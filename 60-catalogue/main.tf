resource "aws_lb_target_group" "catalogue" {
    name     = "${var.project}-${var.environment}-catalogue"  ## roboshop-dev-catalogue
    port     = 8080
    protocol = "HTTP"
    vpc_id   = local.vpc_id

    health_check {
        healthy_threshold = 2
        interval = 5
        matcher = "200-299"
        path = "/health"
        port = 8080
        timeout = 2
        unhealthy_threshold = 3
    }
}

resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.mysql_sg_id]
    subnet_id = local.database_subnet_id

    iam_instance_profile = "EC2RoleToFetchSSMParams"  ## this need to create in IAM roles

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-mysql"
        }
    )
}