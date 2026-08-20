variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "components" {
    default = {
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
            rule_priority = 10
        }
    }
}