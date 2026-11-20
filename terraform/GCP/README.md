# GCP Terraform stack

## Module contract

This provider stack uses the same module layout as the other two clouds:

```text
modules/
├── network/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── security/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── compute/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── load-balancer/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

Each module has one entry point (`main.tf`), a declared input contract (`variables.tf`), and exposed results (`outputs.tf`). Provider-specific implementation details remain inside that provider's module.

## Configuration-only deployment

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Edit values in `terraform.tfvars` (region, names, CIDRs, SKU/type, SSH key, ports, tags, and optional features).
3. Do not edit `main.tf` or module files for ordinary environment changes.
4. Run:

   ```bash
   terraform fmt -recursive
   terraform init
   terraform validate
   terraform plan
   terraform apply
   ```

5. To remove the stack:

   ```bash
   terraform plan -destroy
   terraform destroy
   ```

`terraform.tfvars` is intentionally ignored by Git. Keep credentials and private keys out of it; an SSH **public** key is acceptable.

## Important

- The `terraform.tfvars.example` file is a template, not a ready-to-apply credential file.
- Check provider quotas, region availability, CIDR overlap, and estimated costs before apply.
- This is a learning architecture with one web backend. It is not a production HA design.

## Windows VM extension

See [`docs/WINDOWS-VM-SETUP.md`](docs/WINDOWS-VM-SETUP.md) for the Windows Server module, cloud prerequisites, identity permissions, restricted RDP setup, deployment, credential retrieval, cleanup, and troubleshooting.
