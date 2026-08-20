variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "components" {
    default = {
        catalogue = {
            rule_priority = 10  ### this catalogue and user we created separately, no need to create here. Just added catalogue and user for reference
        }
        user = {
            rule_priority = 20  ### this is just for our understanding to create modules in loop
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        payment = {
            rule_priority = 50
        }
        forntend = {
            rule_priority = 10  #### rule priority should be different in same load balancer, for backend we have one load balancer and frontend_loadbalancer for frontend
        }
    }
}