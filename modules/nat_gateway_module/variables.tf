variable "region_network_border_group" {
  description = "The network border group for the region where the NAT gateway will be deployed."
  type        = string
}

variable "nat_gateway_subnet_id" {
  description = "The subnet ID where the NAT gateway will be deployed."
  type        = string
}



variable "nat_gateway_connectivity_type" {
  description = "The connectivity type for the NAT gateway. Can be either 'public' or 'private'."
  type        = string
  default     = "public"
}
