output "master_instance_public_ips" {
  value = aws_instance.master.public_ip
  description = "Master Node Public Facing Ip"
}

output "slave_instance_public_ips" {
  value = aws_instance.slave.*.public_ip
    description = "Slave Node's Public Facing Ip's"
}

