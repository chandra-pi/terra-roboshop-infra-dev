module "component" {
    for_each = var.components
    ## source = "../../terraform-aws-roboshop" ### this is referring from local directory
    source = "git::https://github.com/chandra-pi/terraform-aws-roboshop.git?ref=main"  #### referring from git
    component = each.key
    rule_priority = each.value.rule_priority
}
