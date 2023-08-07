# Installing All Necessary Software
This document outlines the steps to install various software components on the Master node, including Ansible, Prometheus, Node Exporter, and Grafana (OSS). These steps are after conneting to the ssh she
## Ansible
Ansible is an open-source automation tool that allows you to automate various tasks in IT infrastructure. It simplifies the process of managing multiple servers and applications, making it easy to deploy, configure, and manage systems efficiently.

### Update the system and install necessary packages:
```bash
sudo apt update 
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible 
sudo apt install ansible
```
## Prometheus

Prometheus is an open-source monitoring and alerting toolkit designed for collecting and storing time-series data. It helps monitor various metrics from applications and infrastructure components, providing valuable insights into system health and performance.

Create a directory for Prometheus and download the release:
```bash
mkdir prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar -xvf prometheus-2.46.0.linux-amd64.tar.gz 
sudo mv prometheus-2.46.0.linux-amd64 /usr/local/prometheus
```
Create a systemd service unit file for Prometheus to ensure it starts automatically (`/etc/systemd/system/prometheus.service`) with the following content:
```ini 
[Unit]
Description=Prometheus
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/prometheus/prometheus --config.file=/usr/local/prometheus/prometheus.yml

[Install]
WantedBy=multi-user.target                 
```
## Node Exporter
Node Exporter is a Prometheus exporter that collects various metrics from the system. To install Node Exporter on the Master node, follow these steps:

Create a directory for Node Exporter and download the release and the Node Exporter binary to /`usr/local/bin/`:
```bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar
tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz
sudo mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/node_exporter
```
Create a systemd service unit file (`/etc/systemd/system/node_exporter.service`) with the following content for Node Exporter to ensure it starts automatically:

> Note : This step is done only in the Master node to moniter the machine and is an optional step as Prometheus provides same detials at `/metrics` slug   

```bash 
[Unit]
Description=Node Exporter
After=network.target
 
[Service]
Type=simple
ExecStart=/usr/local/bin/node_exporter
 
[Install]
WantedBy=multi-user.target
```
## Grafana
Grafana (OSS) is a popular open-source analytics and monitoring solution that allows you to visualize and analyze metrics from various data sources. It provides customizable dashboards and supports integration with multiple data storage solutions, making it ideal for monitoring system performance and resource utilization.

Install necessary dependencies:

```bash 
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_10.0.3_amd64.deb
sudo dpkg -i grafana_10.0.3_amd64.deb
```