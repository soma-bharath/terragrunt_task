terraform {
  source = "../../modules/network"
}

inputs = {
  vpc_id            = "vpc-12345678" #replace withyour vpc id
  region            = "us-west-2"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
