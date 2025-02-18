env="dev"
domain_name="siddevsecops.icu"
zoneid="Z0839824JM76ZIPWFCGH"

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




app_instances = {
  catalogue = {
    instance_type = "t2.micro"
    app_port = 8080
    volume_size = 30
  }
  user = {
    instance_type = "t2.micro"
    app_port = 8080
    volume_size = 30
  }
  shipping = {
    instance_type = "t2.micro"
    app_port = 8080
    volume_size = 30
  }
  payment = {
    instance_type = "t2.micro"
    app_port = 8080
    volume_size = 30
  }
  cart = {
    instance_type = "t2.micro"
    app_port = 8080
    volume_size = 30
  }
}

web_instances = {
  frontend = {
    instance_type = "t2.micro"
    app_port      = 80
    volume_size = 20
  }

}

eks = {
  subnet_ids        = ["subnet-027180fd26e9b7be6", "subnet-0b58543d6ea9289da"]
  add-ons           = {
    vpc-cni         = {}
#    coredns         = {}
    kube-proxy      = {}
    eks-pod-identity-agent = {}
  }
  access-entries    = {
   work-station     = {
     principal_arn            = "arn:aws:iam::216989125516:role/workstation-admin"
     kubernetes_groups        = []
     policy_arn               = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
     access_scope_type        = "cluster"
     access_scope_namespaces  = []
   }
    #UI-Access-arn:aws:iam::216989125516:root
    UI-Access     = {
      principal_arn            = "arn:aws:iam::216989125516:root"
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
#      capacity_type = "SPOT"
      capacity_type = "ON_DEMAND"
      instance_types = ["t3.large"]
    }
  }
}