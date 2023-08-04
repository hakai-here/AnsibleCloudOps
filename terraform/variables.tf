variable "instance_type" {
    default     = "t2.micro"
    description = "The EC2 instance type to launch."
}

variable "ubuntu_ami" {
    default     = "ami-0f5ee92e2d63afc18"
    description = "The AMI ID for the Ubuntu instance in the given region."
}

variable "cidr_block" {
    default     = "0.0.0.0/0"
    description = "The CIDR block to be used for allowing universal access to resources."
}

variable "aws_region"{
  default = "ap-south-1"
  description = "The  AWS region to host the service"
}

variable "master_ssh_key_name" {
  default = "master_node_key"
description = "The SSH key used by ansible master connect to the master node"

}

variable "slave_ssh_key_name" {
  default = "slave_node_key"
  description = "The SSH key used by ansible master node to communicate with the slave nodes"
}