resource "aws_nat_gateway" "nategateway_a" {
  allocation_id = aws_eip.Public_eip_a.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "NatGateway_A"
    Environment  = var.env
    Email   = var.Email
    Project_Name = var.Project_Name
    Date = local.current_date
  }
}

resource "aws_nat_gateway" "nategateway_c" {
  allocation_id = aws_eip.Public_eip_c.id
  subnet_id     = aws_subnet.public[2].id
  tags = {
    Name = "NatGateway_C"
    Environment  = var.env
    Email   = var.Email
    Project_Name = var.Project_Name
    Date = local.current_date
  }
}
