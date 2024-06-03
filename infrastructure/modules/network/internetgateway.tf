resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Space_prod_IG"
    Environment  = var.env
    Email   = var.Email
    Project_Name = var.Project_Name
    Date = local.current_date
  }
}
