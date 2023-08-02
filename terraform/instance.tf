resource "aws_instance" "master" {
    ami = var.ubuntu_ami
    instance_type = var.instance_type
    key_name = "master_node_key"
    depends_on = [ aws_security_group.master_sg ]
    vpc_security_group_ids = [ aws_security_group.master_sg.id ]
    tags = {
      Name = "Terraform Master Node"
    }
}

resource "aws_instance" "slave" {
    ami = var.ubuntu_ami
    count = 3
    instance_type = var.instance_type
    key_name = "slave_node_key"
    depends_on = [ aws_security_group.slave_sg ]
    vpc_security_group_ids = [ aws_security_group.slave_sg.id ]

    tags = {
      Name = "Terraform Slave Node ${count.index+1}"
    }
  
}