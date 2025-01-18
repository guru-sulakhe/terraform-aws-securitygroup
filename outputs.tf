output "sg_id" { #exposing sg_id which will later be used in the resource usage process by storing it in the ssm_parameter and using it by creating data sources
    value = aws_security_group.allow_tls.id
}