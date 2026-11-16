# Pipeline variable map for the refactored root inputs

The individual GitHub workflows and the Azure DevOps unified YAML now pass the refactored Terraform variable names. Add the values below to GitHub Repository Variables / Secrets or the Azure DevOps variable group `pipevar`. Names are identical across both platforms (Azure DevOps uses `$(NAME)` references).

**JSON inputs must be valid JSON, not HCL.** Example: `["10.70.1.0/24","10.70.2.0/24"]`. Object/list values are passed through `TF_VAR_*` and Terraform decodes them.

## Azure

| Variable | Example / type |
|---|---|
| `AZURE_LOCATION` | `EastAsia` |
| `AZURE_RESOURCE_GROUP_NAME` | `rg-multicloud-azure` |
| `AZURE_VNET_NAME` | `vnet-multicloud-azure` |
| `AZURE_VNET_ADDRESS_SPACE_JSON` | `["10.40.0.0/16"]` |
| `AZURE_SUBNET_NAME` | `snet-web` |
| `AZURE_SUBNET_PREFIXES_JSON` | `["10.40.1.0/24"]` |
| `AZURE_NSG_NAME` | `nsg-web` |
| `AZURE_SECURITY_RULES_JSON` | JSON list of rule objects; use the example in `terraform/Azure/terraform.tfvars.example` and convert to JSON |
| `AZURE_NIC_NAME` | `nic-web` |
| `AZURE_NIC_IP_CONFIG_NAME` | `primary` |
| `AZURE_VM_NAME` / `AZURE_VM_SIZE` | `vm-multicloud-azure` / `Standard_B2s` |
| `AZURE_ADMIN_USERNAME` | `azureadmin` |
| `AZURE_SSH_PUBLIC_KEY` (Secret) | OpenSSH public key (`ssh-rsa ...` or `ssh-ed25519 ...`) |
| `AZURE_OS_DISK_CACHING` / `AZURE_OS_DISK_STORAGE_TYPE` / `AZURE_OS_DISK_SIZE_GB` | `ReadWrite` / `StandardSSD_LRS` / `30` |
| `AZURE_IMAGE_PUBLISHER` / `AZURE_IMAGE_OFFER` / `AZURE_IMAGE_SKU` / `AZURE_IMAGE_VERSION` | Canonical / `0001-com-ubuntu-server-jammy` / `22_04-lts-gen2` / `latest` |
| `AZURE_WEB_PAGE_TITLE` | `Azure backend` |
| `AZURE_DATA_DISK_COUNT` / `AZURE_DATA_DISK_SIZE_GB` / `AZURE_DATA_DISK_STORAGE_TYPE` / `AZURE_DATA_DISK_CACHING` | `0` / `10` / `StandardSSD_LRS` / `ReadWrite` |
| `AZURE_LB_NAME` / `AZURE_LB_PUBLIC_IP_NAME` | `lb-multicloud-azure` / `pip-multicloud-azure` |
| `AZURE_LB_FRONTEND_NAME` / `AZURE_LB_BACKEND_POOL_NAME` | `public-frontend` / `web-backend-pool` |
| `AZURE_LB_PROBE_NAME` / `AZURE_LB_RULE_NAME` / `AZURE_LB_OUTBOUND_RULE_NAME` | `http-health-probe` / `http-rule` / `web-egress` |
| `AZURE_LB_FRONTEND_PORT` / `AZURE_LB_BACKEND_PORT` | `80` / `80` |
| `AZURE_LB_PROBE_PATH` / `AZURE_LB_PROBE_INTERVAL` / `AZURE_LB_PROBE_COUNT` | `/` / `15` / `2` |
| `AZURE_LB_OUTBOUND_PORTS` | `1024` |
| `AZURE_TAGS_JSON` | `{"environment":"lab","managed_by":"terraform"}` |

Keep the existing Azure identity/backend values too: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, and `AZURE_TFSTATE_SAS_TOKEN` (Secrets).

## AWS

| Variable | Example / type |
|---|---|
| `AWS_REGION` | `us-east-1` |
| `AWS_ROLE_ARN` (existing) | IAM role ARN assumed by OIDC |
| `AWS_STACK_NAME` | `multicloud-aws` |
| `AWS_VPC_CIDR` | `10.50.0.0/16` |
| `AWS_PUBLIC_SUBNET_CIDRS_JSON` | `["10.50.1.0/24","10.50.2.0/24"]` |
| `AWS_INSTANCE_TYPE` | `t3.micro` |
| `AWS_AMI_ID` | empty or a valid AMI ID (empty uses SSM lookup) |
| `AWS_AMI_SSM_PARAMETER` | `/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64` |
| `AWS_KEY_NAME` | empty or existing EC2 key pair |
| `AWS_ALLOWED_SSH_CIDRS_JSON` | `[]` or `["YOUR_PUBLIC_IP/32"]` |
| `AWS_ALB_INGRESS_CIDRS_JSON` | `["0.0.0.0/0"]` |
| `AWS_HTTP_PORT` / `AWS_SSH_PORT` | `80` / `22` |
| `AWS_WEB_PAGE_TITLE` | `AWS backend` |
| `AWS_ALB_INTERNAL` | `false` |
| `AWS_ALB_LISTENER_PORT` / `AWS_ALB_BACKEND_PORT` | `80` / `80` |
| `AWS_ALB_HEALTH_CHECK_PATH` / `AWS_ALB_HEALTH_CHECK_MATCHER` | `/` / `200-399` |
| `AWS_TAGS_JSON` | `{"environment":"lab","managed_by":"terraform"}` |

## GCP

| Variable | Example / type |
|---|---|
| `GCP_PROJECT_ID` | Your real project ID |
| `GCP_REGION` / `GCP_ZONE` | `us-central1` / `us-central1-a` |
| `GCP_WORKLOAD_IDENTITY_PROVIDER` / `GCP_TERRAFORM_SERVICE_ACCOUNT` (existing) | Existing WIF provider and service account resource names |
| `GCP_STACK_NAME` | `multicloud-gcp` |
| `GCP_SUBNET_CIDR` | `10.60.1.0/24` |
| `GCP_MACHINE_TYPE` | `e2-micro` |
| `GCP_NETWORK_TAGS_JSON` | `["multicloud-gcp-web"]` |
| `GCP_BOOT_DISK_IMAGE` / `GCP_BOOT_DISK_SIZE_GB` / `GCP_BOOT_DISK_TYPE` | `debian-cloud/debian-12` / `10` / `pd-balanced` |
| `GCP_ASSIGN_PUBLIC_IP` | `true` |
| `GCP_WEB_PAGE_TITLE` | `GCP backend` |
| `GCP_HTTP_SOURCE_RANGES_JSON` | `["0.0.0.0/0"]` |
| `GCP_HEALTH_CHECK_SOURCE_RANGES_JSON` | `["35.191.0.0/16","130.211.0.0/22"]` |
| `GCP_SSH_SOURCE_RANGES_JSON` | `[]` or `["YOUR_PUBLIC_IP/32"]` |
| `GCP_HTTP_PORT` / `GCP_SSH_PORT` | `80` / `22` |
| `GCP_LB_BACKEND_PORT_NAME` / `GCP_LB_BACKEND_PORT` / `GCP_LB_FRONTEND_PORT` | `http` / `80` / `80` |
| `GCP_LB_HEALTH_CHECK_PATH` | `/` |

## Azure DevOps service connections

The existing service connection names in `azure-multi-cloud-deployment-unified.yml` are retained. The `pipevar` group must contain the same input variables above plus the existing WIF/backend credentials.
