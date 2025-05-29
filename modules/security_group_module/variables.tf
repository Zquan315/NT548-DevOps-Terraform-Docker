variable "vpc_id" {
  description = "The VPC ID to associate the security group with"
  type        = string
}

variable "from_port_in_private" {
  description = "The starting port for the ingress rule"
  type        = number
}

variable "to_port_in_private" {
  description = "The ending port for the ingress rule"
  type        = number
}

variable "protocol_in_private" {
  description = "The protocol for the ingress rule"
  type        = string
}


variable "from_port_e_private" {
  description = "The starting port for the egress rule"
  type        = number
  default = 0
}

variable "to_port_e_private" {
  description = "The ending port for the egress rule"
  type        = number
  default = 0
}

variable "protocol_e_private" {
  description = "The protocol for the egress rule"
  type        = string
  default = "-1"
}

variable "cidr_blocks_e_private" {
  description = "The CIDR blocks for the egress rule"
  type        = list(string)
  default = ["0.0.0.0/0"]
}

#public security group
variable "ingress_rules_public" {
  description = "List of ingress rules for the public security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string, "")
  }))
  default = []
  
}

variable "from_port_e_public" {
  description = "The starting port for the egress rule"
  type        = number
  default = 0
}

variable "to_port_e_public" {
  description = "The ending port for the egress rule"
  type        = number
  default = 0
}

variable "protocol_e_public" {
  description = "The protocol for the egress rule"
  type        = string
  default = "-1"
}

variable "cidr_blocks_e_public" {
  description = "The CIDR blocks for the egress rule"
  type        = list(string)
  default = ["0.0.0.0/0"]
}