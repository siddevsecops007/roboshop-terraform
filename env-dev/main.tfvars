env="dev"
domain_name="siddevsecops.icu"
zoneid="Z0839824JM76ZIPWFCGH"

db_instances = {
  mongodb = {
    instance_type = "t2.micro"
    app_port = 27017
  }
  mysql = {
    instance_type = "t2.micro"
    app_port = 3306
  }
  redis = {
    instance_type = "t2.micro"
    app_port = 6379
  }
  rabbitmq = {
    instance_type = "t2.micro"
    app_port = 5672
  }

}




app_instances = {
  catalogue = {
    instance_type = "t2.micro"
    app_port = 8080
  }
  user = {
    instance_type = "t2.micro"
    app_port = 8080
  }
  shipping = {
    instance_type = "t2.micro"
    app_port = 8080
  }
  payment = {
    instance_type = "t2.micro"
    app_port = 8080
  }
  cart = {
    instance_type = "t2.micro"
    app_port = 8080
  }
}

web_instances = {
  frontend = {
    instance_type = "t2.micro"
    app_port      = 80
  }

}