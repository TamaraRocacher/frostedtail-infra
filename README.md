# The Frosted Tail — Infrastructure

Infrastructure as Code and deployment configuration for **The Frosted Tail**, a bookbinding e-commerce project.

This repository contains the infrastructure, server configuration and deployment tooling used to host the application on an OVHcloud VPS.

> 🚧 Work in progress — the infrastructure is currently being migrated toward a fully automated and reproducible setup.

## Architecture

The target architecture includes:

- **OVHcloud VPS** — Debian 13
- **Terraform** — OVHcloud infrastructure management
- **Ansible** — server configuration and hardening
- **Docker / Docker Compose** — application and monitoring services
- **Nginx** — reverse proxy
- **GitHub Actions** — CI/CD
- **Prometheus & Grafana** — monitoring and observability

The application will use separate **staging** and **production** environments on the same VPS.

## Repository structure

```text
.
├── ansible/
│   ├── inventory/
│   ├── group_vars/
│   ├── playbooks/
│   └── roles/
│
├── terraform/
│   ├── bootstrap/
│   └── ovh/
│
├── .gitignore
└── README.md
```

### Terraform

Terraform is used to manage supported OVHcloud infrastructure resources.

The `bootstrap` configuration documents the creation of the OAuth2 client and IAM policy used by Terraform to authenticate against the OVHcloud API.

> The existing VPS currently cannot be imported as an `ovh_vps` resource because its model version is not yet supported by the current OVHcloud Terraform provider.

### Ansible

Ansible manages the configuration of the Debian server, including:

- system configuration
- SSH hardening
- firewall rules
- Fail2ban
- Docker
- Nginx
- application deployment prerequisites

The configuration is designed to be idempotent and reproducible.

## Security

Sensitive data is never committed to the repository.

Local files containing credentials, Terraform state and environment variables are excluded through `.gitignore`.

Authentication uses:

- SSH public-key authentication for server access
- an OAuth2 client with scoped IAM permissions for the OVHcloud API
- separate secrets for deployment environments

## Deployment

The planned deployment workflow is:

```text
Pull Request
    │
    ├── Lint & tests
    ├── Security checks
    └── Docker build

main
    │
    └── Automatic deployment → Staging
                              │
                              └── Manual promotion → Production
```

The same application image will be promoted from staging to production.

## Monitoring

The monitoring stack will include:

- Prometheus
- Grafana
- Node Exporter
- Nginx Exporter

Monitoring services will initially run on the same VPS as the application.

## Status

🚧 **Infrastructure migration in progress**

The VPS has been provisioned and manually hardened. The current work focuses on converting the existing configuration to reproducible Infrastructure as Code.

## Related project

The application source code is maintained separately from this infrastructure repository.

## License

This repository is provided primarily as a technical portfolio and infrastructure reference.