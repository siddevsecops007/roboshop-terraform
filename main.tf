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
    volume_size    = each.value["volume_size"]
}

# module "app_instaces" {
#     depends_on = [module.db_instaces]
#     for_each       = var.app_instances
#     source         = "./modules/ec2"
#     env            = var.env
#     instance_type  = each.value["instance_type"]
#     component_name = each.key
#     app_port       = each.value["app_port"]
#     domain_name    = var.domain_name
#     zoneid         = var.zoneid
#     vault_token    = var.vault_token
#     volume_size    = each.value["volume_size"]
# }
#
# module "web_db_instaces" {
#     depends_on = [module.app_instaces]
#     for_each       = var.web_instances
#     source         = "./modules/ec2"
#     env            = var.env
#     instance_type  = each.value["instance_type"]
#     component_name = each.key
#     app_port       = each.value["app_port"]
#     domain_name    = var.domain_name
#     zoneid         = var.zoneid
#     vault_token    = var.vault_token
#     volume_size    = each.value["volume_size"]
# }

module "eks" {
    source              = "./modules/eks"
    env                 = var.env
    subnet_ids          = var.eks["subnet_ids"]
}

output "add-on" {
    value = module.eks
}





