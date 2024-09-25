variable "sg_ports_kriyamainapp" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 22,443]
}

resource "aws_security_group" "mainapp_master_sg1" {
  name        = "mainapp_master_sg1"
  description = "mainapp_master_sg1"
  vpc_id = "vpc-03ed02f5d15f66cc0"

  dynamic "ingress" {
    for_each = var.sg_ports_kriyamainapp
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_vpc_security_group_egress_rule" "master_mainapp_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.mainapp_master_sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
 
  
