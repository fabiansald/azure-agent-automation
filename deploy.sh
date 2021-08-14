#!/bin/bash
# ****************************************************
# (C) Rackspace 2021, fabian.salamanca@rackspace.com *
# ****************************************************

TERRAFORM=$(which terraform)

if [ ! -f ${TERRAFORM} ]; then
	echo "Terraform not installed"
	exit 1
fi

if [ -d .venv ]; then
	source .venv/bin/activate
fi

if [ -d venv ]; then
	source venv/bin/activate
fi

ANSIBLE=$(which ansible)

if [ ! -f ${ANSIBLE} ]; then
	echo "Ansible not installed"
	exit 1
fi

echo "Terraform init:"
${TERRAFORM} init
echo "Terraform fmt:"
${TERRAFORM} fmt
echo "Terraform validate:"
${TERRAFORM} validate
echo "Terraform plan:"
${TERRAFORM} plan
echo "Terraform apply:"
${TERRAFORM} apply -auto-approve
sleep 2
${TERRAFORM} apply -auto-approve

echo ""
echo "ANSIBLE"
echo ""
ansible-playbook -i ansible/hosts ansible/main.yml -vv

