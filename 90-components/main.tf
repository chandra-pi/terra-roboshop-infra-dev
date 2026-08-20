module "component" {
    for_each = var.components
    source = "../../terraform-aws-roboshop" ### this is referring from local directory
    component = each.key
    rule_priority = each.value.rule_priority
}
