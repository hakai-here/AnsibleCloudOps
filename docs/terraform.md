# Terraform AWS Infrastructure Setup

This Terraform configuration is designed to deploy an infrastructure on AWS that consists of a master node and multiple slave nodes. The infrastructure runs Ubuntu instances and sets up security groups to control inbound and outbound traffic.

## Infrastructure Components

The Terraform configuration consists of the following components:

### variable.tf

This file defines various variables that can be customized to tailor the infrastructure to specific requirements. The variables and their descriptions are as follows:

- `instance_type` : This variable sets the EC2 instance type to launch. The default value is `t2.micro`, but you can modify it to use a different instance type based on your needs.

- `ubuntu_ami` : This variable specifies the AMI ID for the Ubuntu instance in the AWS region. The default value is set to `ami-0f5ee92e2d63afc18`. You can update it to use a different Ubuntu AMI.

- `cidr_block`: This variable defines the CIDR block to be used for allowing universal access to resources. The default value is set to `0.0.0.0/0`, which means unrestricted access from any IP. Adjust it to limit access as required.

- `master_ssh_key_name`: This variable sets the SSH key name used by the Ansible master to connect to the master node. The default value is set to `master_node_key`, but you can specify your own SSH key name.

- `slave_ssh_key_name` : This variable sets the SSH key name used by the Ansible master node to communicate with the slave nodes. The default value is set to `slave_node_key`, but you can use a different key name if needed.

### provider.tf

This file specifies the provider and its configuration. In this case, the configuration uses the AWS provider to provision resources in AWS. The specific configuration is as follows:

- Provider: The aws provider is required for provisioning resources in AWS.

- region: The AWS region where the infrastructure will be deployed is set to `ap-south-1`. You can change this value to deploy resources in a different region.

### security-group.tf

This file creates security groups to control inbound and outbound traffic for both the master and slave nodes. The security groups ensure that the necessary ports are accessible while restricting access to specific ports. The security groups' configuration is as follows:

- `aws_security_group.master_sg`: This resource creates a security group for the master node. It allows inbound access for `SSH` (port 22), `Node Exporter` (port 9100), `Grafana` (port 3000), and `Prometheus` (port 9090). All outbound traffic is allowed for now.

- `aws_security_group.slave_sg`: This resource creates a security group for the slave nodes. It allows inbound access for `SSH` (port 22) and `Node Exporter` (port 9100). All outbound traffic is allowed.

### instance.tf
This file creates the EC2 instances for both the master and slave nodes. The instances are launched using the specified AMI, instance type, and associated security groups. The configuration is as follows:

- `aws_instance.master`: This resource creates the master node. It uses the specified ami, instance_type, and key_name. The depends_on attribute ensures that the master security group (`aws_security_group.master_sg`) is created before the instance.

- `aws_instance.slave`: This resource creates multiple slave nodes. The number of instances is determined by the count parameter, which is set to 3 in this configuration. Each slave node uses the specified ami, instance_type, and key_name. The depends_on attribute ensures that the slave security group (`aws_security_group.slave_sg`) is created before launching the instances.

### output.tf
This file defines the outputs that will be displayed after running the Terraform configuration. The outputs provide useful information about the deployed infrastructure. The configured outputs are:

- `master_instance_public_ips`: This output displays the public IP address of the master node. You can use this IP to access the master node via SSH or other services.

- `slave_instance_public_ips`: This output displays a list of public IP addresses of all the slave nodes. The list of IPs can be used to access the individual slave nodes if needed.


# Deploying the Infrastructure
Before applying the Terraform configuration, ensure that you have configured your AWS cli credentials and that Terraform has the required permissions to create resources in your AWS Iam account.

To deploy the infrastructure, run the following commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```
Review the configuration and make any necessary adjustments to match your specific needs before running terraform apply. Once the deployment is complete, you will have a functioning infrastructure with a master node and multiple slave nodes, ready for further configuration and us