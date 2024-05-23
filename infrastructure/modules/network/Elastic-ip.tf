resource "aws_eip" "my_eip" {
  vpc = true
  tags = {
    Name = "My-EIP"
    Date = local.current_date
  }
}
