resource "aws_eip" "nhom16_eip_allocate_nat_gateway" {
    network_border_group = var.region_network_border_group
    tags = {
        Name = "nhom16_eip-allocate-nat-gateway"
    }
  
}

# NAT Gateway
resource "aws_nat_gateway" "nhom16_nat_gateway" {
    allocation_id     = aws_eip.nhom16_eip_allocate_nat_gateway.id
    subnet_id         = var.nat_gateway_subnet_id
    connectivity_type = var.nat_gateway_connectivity_type
    tags = {
        Name = "nhom16_nat_gateway"
    }
}

