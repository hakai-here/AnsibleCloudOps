# AnsibleCloudOps

## Introduction

AnsibleCloudOps is a DevOps project is to demonstrate the creation of infrastructure in the AWS cloud using Terraform and configure systems using Ansible. The project aims to simplify the deployment and management of cloud resources while ensuring efficiency, scalability, and reliability.

## Project Goals

The primary objectives of AnsibleCloudOps are as follows:

- Infrastructure as Code (IaC): Utilize Terraform to define the entire AWS infrastructure as code, enabling version-controlled, reproducible, and automated infrastructure deployments.
- Configuration Management: Leverage Ansible to automate the configuration of systems within the AWS environment, ensuring consistent and standardized setups.
- Monitoring and Alerting: Implement Node Exporter, Grafana, and Prometheus to monitor and visualize the network performance, enabling timely detection and resolution of issues.
## Module Based 
[Terraform AWS Infrastructure Setup](./docs/terraform.md) 
## Prerequisites
Before using AnsibleCloudOps, ensure you have the following dependencies set up:

- An AWS account with necessary credentials and permissions to create resources.
- Terraform installed on your local machine.



<BR>

# Getting Started with AnsibleCloudOps

To start using AnsibleCloudOps, follow these steps:
## Terraform 
- Clone the AnsibleCloudOps repository to your local machine.
- Navigate to the project's [terraform](./terraform/variables.tf) directory and update the necessary variables in the Terraform files, such as AWS region, instance types, etc.
- After updating the variables, you are ready to apply the [Terraform configuration](./docs/terraform.md) and create the infrastructure on AWS.

## Installation and Configuration 
Once the infrastructure is set up, you can proceed with configuring the systems using [Installation](./docs/installing.md) and [Configuration](./docs/configuring.md) Docs 
