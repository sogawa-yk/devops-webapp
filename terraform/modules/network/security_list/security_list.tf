resource "oci_core_security_list" "security_list" {
  for_each = var.security_lists

  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  display_name = each.value.display_name

  dynamic "egress_security_rules" {
    for_each = each.value.eggress_security_rules
    iterator = rule

    stateless        = rule.value.stateless
    destination      = rule.value.destination
    destination_type = rule.value.destination_type
    protocol         = rule.value.protocol
  }

  dynamic "ingress_secrity_rules" {
    for_each = each.value.ingress_security_rules
    iterator = rule

    stateless        = rule.value.stateless
    destination      = rule.value.destination
    destination_type = rule.value.destination_type
    proocol          = rule.value.protocol
  }
}
