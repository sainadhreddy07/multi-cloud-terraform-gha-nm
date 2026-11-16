# Refactor notes — November 2026

## What changed

- Standardized Azure, AWS, and GCP module folders to `network`, `security`, `compute`, and `load-balancer`.
- Standardized every module's contract to `main.tf`, `variables.tf`, and `outputs.tf`.
- Rebuilt root `main.tf` files as composition/wiring only.
- Promoted environment-specific names, CIDRs, ports, machine sizes, disks, tags, security ranges/rules, and image settings to root variables.
- Added complete `terraform.tfvars.example` files for all clouds.
- Added external cloud-init/startup scripts to compute modules so the main resource files stay readable.
- Updated provider-specific GitHub workflows and the unified GitHub workflow to pass the new `TF_VAR_*` inputs.
- Updated the Azure DevOps unified pipeline's input mappings.
- Added `PIPELINE-VARIABLES.md` for JSON variable examples and pipeline setup.

## Intentional design boundary

For ordinary environment changes, edit only `terraform.tfvars` (local) or pipeline variables (CI). Do not change root/module `.tf` files. Adding a new resource type, changing the architecture, or introducing a provider feature still requires Terraform code changes.

## Validation status

- Checked module folder/file uniformity across all three providers.
- Checked root module `var.*` references against declared root variables.
- Checked module `var.*` references against module declarations.
- Checked every root variable is represented in its `.tfvars.example` and provider workflow mappings.
- Parsed workflow YAML files successfully.
- Terraform CLI `fmt`, `validate`, and cloud `plan` were not run in this environment. Run them in your Terraform-enabled environment before applying.
