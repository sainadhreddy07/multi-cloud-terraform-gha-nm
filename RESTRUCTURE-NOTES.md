# Repository restructure notes

This archive reorganizes the existing Terraform child modules into the agreed cloud-root and nested module directory layout. GitHub Actions workflow files were retained with their existing triggers, auth, stages/jobs, approvals, and commands; cloud root directories remain `terraform/Azure`, `terraform/AWS`, and `terraform/GCP`, so their working-directory settings remain valid.

`terraform/environments/TEST/` now contains copied `.tfvars.example` files for each cloud. Rename/copy the example to the real `.tfvars` and supply your values; do not commit secrets.

## Important implementation boundary
This is a structural relocation of the modules present in the source archive, not a redesign of resource behavior. The existing Azure compute module still owns NIC, Linux VM, and data-disk resources together; AWS/GCP compute modules remain their existing single Linux instance implementations. Separate Windows VM and independent data-disk modules, and a standalone Azure resource-group module, were not present in the source ZIP and therefore were not fabricated here. The folder layout is ready for those additions, but those modules need a deliberate code refactor before they can be called implemented.
