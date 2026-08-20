module "user" {
    source = "../../terraform-aws-roboshop" ### this is referring from local directory
    component = "user"
    rule_priority = 20
}

### bootstrap.sh file should present in where we are using the module, not in the module definition