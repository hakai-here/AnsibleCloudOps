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
