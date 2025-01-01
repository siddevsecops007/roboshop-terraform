module "ec2" {
    for_each       = var.instances
    source         = "./modules/ec2"
    env            = var.env
    instance_type  = each.value["instance_type"]
    component_name = each.key
    app_port       = each.value["app_port"]
}


