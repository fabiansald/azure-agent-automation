# RAXPS Azure Linux Agent Creation

## Project Info

* Customer Account number: N/A
* Customer name: RAX PS Azure Team
* Project Name: Azure DevOps Agent creation
* PSR:
* Date:

## Rackspace team

* AP:
* EM: 
* Architect: Fabian Salamanca
* Cloud Engineer: 

## Goals

* Automate Azure DevOps Agent creation and configuration

## Prerequisites

* Ansible 2.9 or later
* Terraform
* Azure CLI
* Azure account

## Installation

* Configure backend.tf with correct parameters
* Run:

```
./deploy.sh
```

## Success Criteria

### Landing Zone

* Create VNet
* Create VM
* Create NSG
* Assign public IP

### Configuration

* Update OS
* Install Azure CLI, Terraform, PowerShell, Git, Ansible, PowerShell Azure Module, Docker, kubectl and istioctl
* Download and untar Azure DevOps Linux Agent software

## TODO

* Agent configuration is interactive, need to automate maybe using expect

