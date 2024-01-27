#dev infra

module "dev-demo-app" {
  source        = "./module/demo-app"
  env_name      = "dev"
  instance_type = "t2.micro"
  ami_id        = "ami-0a2e7efb4257c0907"
  instance_name = "first-instance-for-dev"
  bucket_name   = "devbucketasddd"
  dynamodb_table    = "dev-table"
}



#stagging infra
module "stagging-demo-app" {
  source        = "./module/demo-app"
  env_name      = "stagging"
  instance_type = "t2.small"
  ami_id        = "ami-0c00c714c7f84b49d"
  instance_name = "first-instance-for-stagging"
  bucket_name   = "devbucketasddd"
  dynamodb_table    = "dev-table"
}




#production infra

module "production-demo-app" {
  source        = "./module/demo-app"
  env_name      = "production"
  instance_type = "t2.medium"
  ami_id        = "ami-0d270005f18b0539a"
  instance_name = "first-instance-for-production"
  bucket_name   = "devbucketasddd"
  dynamodb_table    = "dev-table"
}
