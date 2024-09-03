variable "project_name" {
    type = string
}
variable "environment" {
    type = string
}
variable "sg_name" {
    type = string
}
variable "sg_description" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "sg_tags" {
    type = map
    default = {}
}
variable "common_tags" {
    type = map
}

#outbound block
variable "outbound_rules" {
    type = list
    default = [
        {
            from_port = 0
            to_port = 0
            protocol = "-1" # all protocols
            cidr_blocks = ["0.0.0.0/0"]
        }
        
    ]
}

#inbound block
variable "inbound_rules" {
    type = list
    default = []
}

