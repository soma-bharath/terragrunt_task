resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Space-prod-public-route-table"
    Environment  = var.env
    Email   = var.Email
    Project_Name = var.Project_Name
    Date = local.current_date
  }
}

resource "aws_route_table" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    #nat_gateway_id = var.nat_gateway_ids[count.index % length(var.nat_gateway_ids)]
    nat_gateway_id = element(concat([aws_nat_gateway.nategateway_a.id, aws_nat_gateway.nategateway_c.id]), count.index % 2)
  }

  tags = {
    Name = "Space-prod-private-route-table-${count.index + 1}"
    Environment  = var.env
    Email   = var.Email
    Project_Name = var.Project_Name
    Date = local.current_date
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}
