# Display available commands
default:
    @just --list

# Check the Ansible configuration without applying changes
ansible-check:
    cd ansible && ansible-playbook -i inventory/hosts.yml playbooks/server.yml --ask-become-pass --check --diff

# Apply the Ansible configuration
ansible-apply:
    cd ansible && ansible-playbook -i inventory/hosts.yml playbooks/server.yml --ask-become-pass

# Install Ansible dependencies
ansible-deps:
    cd ansible && ansible-galaxy collection install -r requirements.yml