
data "aws_vpc" "default" { # using default vpc in aws . change the code to add custom vpc 
  default = true
}

# setting up security groups for master node and slave node 

resource "aws_security_group" "master_sg" {
  name        = "Terraform-master-SG"
  description = "Setting master Security geoup to allow connections"
  vpc_id      = data.aws_vpc.default.id

  ingress = [
    {
      description      = "SSH ingress"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Node Exporter"
      from_port        = 9100
      to_port          = 9100
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Grafana ingress"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Prometheus ingress"
      from_port        = 9090
      to_port          = 9090
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "slave_sg" {
  name        = "Terraform-slave-SG"
  description = "Setting up ingress and engress rules for slave nodes"
  vpc_id      = data.aws_vpc.default.id

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Node Exporter"
      from_port        = 9100
      to_port          = 9100
      protocol         = "tcp"
      cidr_blocks      = [var.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
