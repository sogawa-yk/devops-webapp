variable "compartment_id" {
  type = string
}
variable "vcn_id" {
  type = string
}
variable "security_lists" {
  type = map(object({
    display_name = string
    egress_security_rules = list(object({
      stateless        = string
      destination      = string
      destination_type = string
      protocol         = string
    }))
    ingress_security_rules = list(object({
      stateless        = string
      destination      = string
      destination_type = string
      protocol         = string
    }))
  }))
}
