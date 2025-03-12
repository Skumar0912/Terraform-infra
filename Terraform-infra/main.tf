module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = "ami-12345678"
  instance_type = "t3.micro"
  subnets = module.vpc.public_subnets
  desired_capacity = 2
  min_size = 1
  max_size = 3
}

module "rds" {
  source = "./modules/rds"
  db_name = "appdb"
  db_user = "admin"
  db_pass = "securepassword"
}

module "alb" {
  source = "./modules/alb"
  security_groups = ["sg-12345678"]
  subnets = module.vpc.public_subnets
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "my-app-static-content"
}
