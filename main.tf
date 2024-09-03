resource "aws_security_group" "allow_tls" {
  name        = local.sg_name_final
  description = var.sg_description
  vpc_id      = var.vpc_id

#terraform block
dynamic "egress" { # looping ingress block
    for_each = var.outbound_rules # looping inbound_rules resource
    content {
        from_port        = egress.value["from_port"] # block-name.value["key-name"]
        to_port          = egress.value["to_port"]
        protocol         = egress.value["protocol"]
        cidr_blocks      = egress.value["cidr_blocks"]
    }
}

dynamic "ingress" { # looping ingress block
    for_each = var.inbound_rules # looping inbound_rules resource
    content {
        from_port        = ingress.value["from_port"] # block-name.value["key-name"]
        to_port          = ingress.value["to_port"]
        protocol         = inress.value["protocol"]
        cidr_blocks      = ingress.value["cidr_blocks"]
    }
}
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
        Name = local.sg_name_final
    }
  )
}