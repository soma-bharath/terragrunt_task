terraform {
  source = "../../modules/network"
}

inputs = {
  vpc_id            = "vpc-0f3457e5a5cd0c803" #replace withyour vpc id
  region            = "us-gov-west-1"
  public_subnet_cidrs = ["10.60.80.0/20", "10.60.96.0/20","10.60.112.0/20"]
  private_subnet_cidrs = ["10.60.16.0/20", "10.60.96.0/20", "10.60.112.0/20","10.60.128.0/20","10.60.144.0/20","10.60.160.0/20"]
  availability_zones  = ["us-gov-west-1a", "us-gov-west-1b", "us-gov-west-1c"]
  public_subnet_names = ["spaces-prod-public-1a","spaces-prod-public-1b","spaces-prod-public-1c"]
  private_subnet_names = ["spaces-prod-app-1a","spaces-prod-app-1b","spaces-prod-app-1c","spaces-prod-db-1a","spaces-prod-db-1b","spaces-prod-db-1c"]
}
