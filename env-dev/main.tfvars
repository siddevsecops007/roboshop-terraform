###zoneid
env="dev"
domain_name="siddevsecops.icu"
#zoneid="Z0839824JM76ZIPWFCGH"
#zoneid = "Z0949039285DH1J81BA7"
zoneid = "Z09554111AOE4XJPNZU5J"


db_instances = {
  mongodb = {
    instance_type = "t2.micro"
    app_port = 27017
    volume_size = 20
  }
  mysql = {
    instance_type = "t2.micro"
    app_port = 3306
    volume_size = 20
  }
  redis = {
    instance_type = "t2.micro"
    app_port = 6379
    volume_size = 20
  }
  rabbitmq = {
    instance_type = "t2.micro"
    app_port = 5672
    volume_size = 20
  }

}




# app_instances = {
#   catalogue = {
#     instance_type = "t2.micro"
#     app_port = 8080
#     volume_size = 30
#   }
#   user = {
#     instance_type = "t2.micro"
#     app_port = 8080
#     volume_size = 30
#   }
#   shipping = {
#     instance_type = "t2.micro"
#     app_port = 8080
#     volume_size = 30
#   }
#   payment = {
#     instance_type = "t2.micro"
#     app_port = 8080
#     volume_size = 30
#   }
#   cart = {
#     instance_type = "t2.micro"
#     app_port = 8080
#     volume_size = 30
#   }
# }
#
# web_instances = {
#   frontend = {
#     instance_type = "t2.micro"
#     app_port      = 80
#     volume_size = 20
#   }
#
# }

eks = {
#  subnet_ids        = ["subnet-0e62dd7b4f8823e28", "subnet-058ab8fac9974470a"]
  subnet_ids        = ["subnet-0d574c124d3405f0c", "subnet-0474a59e1ff0e7774"]
  add-ons           = {
    vpc-cni         = {}
#    coredns         = {}
    kube-proxy      = {}
    eks-pod-identity-agent = {}
  }
  access-entries    = {
   work-station     = {
#     principal_arn            = "arn:aws:iam::160885263759:role/workstation-admin"
     principal_arn            = "arn:aws:iam::981349713796:role/workstation-role"
     kubernetes_groups        = []
     policy_arn               = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
     access_scope_type        = "cluster"
     access_scope_namespaces  = []
   }
    #UI-Access-arn:aws:iam::216989125516:root
    UI-Access     = {
#      principal_arn            = "arn:aws:iam::160885263759:root"
      principal_arn            = "arn:aws:iam::981349713796:root"
      kubernetes_groups        = []
      policy_arn               = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type        = "cluster"
      access_scope_namespaces  = []
    }
  }
  node-groups       = {
    g1              = {
      desired_size  = 1
      max_size      = 2
      min_size      = 1
      capacity_type = "SPOT"
      capacity_type = "ON_DEMAND"
      instance_types = ["t3.large"]
    }
  }
}

##