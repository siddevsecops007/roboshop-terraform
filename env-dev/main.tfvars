env="dev"

instances = {
  frontend = {
    instance_type = "t2.micro"
    app_port = 80
  }
  catalogue = {
    instance_type = "t2.micro"
    app_port = 8080
  }
}