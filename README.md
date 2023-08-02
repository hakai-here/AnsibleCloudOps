# AnsibleCloudOps

## Introduction

AnsibleCloudOps is a DevOps project is to demonstrate the creation of infrastructure in the AWS cloud using Terraform and configure systems using Ansible. The project aims to simplify the deployment and management of cloud resources while ensuring efficiency, scalability, and reliability.

## Project Goals

The primary objectives of AnsibleCloudOps are as follows:

- Infrastructure as Code (IaC): Utilize Terraform to define the entire AWS infrastructure as code, enabling version-controlled, reproducible, and automated infrastructure deployments.
- Configuration Management: Leverage Ansible to automate the configuration of systems within the AWS environment, ensuring consistent and standardized setups.
- Monitoring and Alerting: Implement Node Exporter, Grafana, and Prometheus to monitor and visualize the network performance, enabling timely detection and resolution of issues.

## Prerequisites
Before using AnsibleCloudOps, ensure you have the following dependencies set up:

- An AWS account with necessary credentials and permissions to create resources.
- Terraform installed on your local machine.


## Getting Started

To start using AnsibleCloudOps, follow these steps:

- Clone the AnsibleCloudOps repository to your local machine.
- Navigate to the project's [terraform](./terraform/) directory and update the necessary variables in the Terraform files, such as AWS region, instance types, etc.
- Run `terraform init` to initialize the Terraform project.
- Run `terraform apply` to create the infrastructure on AWS.