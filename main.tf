module "db_instaces" {
    for_each       = var.db_instances
    source         = "./modules/ec2"
    env            = var.env
    instance_type  = each.value["instance_type"]
    component_name = each.key
    app_port       = each.value["app_port"]
    domain_name    = var.domain_name
    zoneid         = var.zoneid
    vault_token    = var.vault_token
}

module "app_instaces" {
    depends_on = [module.db_instaces]
    for_each       = var.app_instances
    source         = "./modules/ec2"
    env            = var.env
    instance_type  = each.value["instance_type"]
    component_name = each.key
    app_port       = each.value["app_port"]
    domain_name    = var.domain_name
    zoneid         = var.zoneid
    vault_token    = var.vault_token
}

module "web_db_instaces" {
    depends_on = [module.app_instaces]
    for_each       = var.web_instances
    source         = "./modules/ec2"
    env            = var.env
    instance_type  = each.value["instance_type"]
    component_name = each.key
    app_port       = each.value["app_port"]
    domain_name    = var.domain_name
    zoneid         = var.zoneid
    vault_token    = var.vault_token
}




