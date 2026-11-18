location            = "eastus2"
resource_group_name = "rg-azure-terraform-lab"

vnet_name               = "azure-vnet-01"
vnet_address_space      = ["10.10.0.0/16"]
subnet_name             = "azure-subnet-01"
subnet_address_prefixes = ["10.10.1.0/24"]
nsg_name                = "azure-nsg-01"

# Linux VM
nic_name                  = "azure-linux-nic"
nic_ip_configuration_name = "primary"
vm_name                   = "azure-linux-vm"
vm_size                   = "Standard_D2as_v6"
admin_username            = "azurelabuser"
os_disk_caching           = "ReadWrite"
os_disk_storage_type      = "StandardSSD_LRS"
os_disk_size_gb           = 30
image_publisher           = "Canonical"
image_offer               = "0001-com-ubuntu-server-jammy"
image_sku                 = "22_04-lts-gen2"
image_version             = "latest"
web_page_title            = "Azure backend"
data_disk_count           = 0
data_disk_size_gb         = 10
data_disk_storage_type    = "StandardSSD_LRS"
data_disk_caching         = "ReadWrite"

# Windows VM - 2 vCPU / 8 GiB candidate selected from the supplied pricing screenshots.
windows_nic_name                  = "azure-windows-nic"
windows_nic_ip_configuration_name = "windows-primary"
windows_vm_name                   = "azure-windows-vm"
windows_vm_size                   = "Standard_D2as_v7"
windows_admin_username            = "azurewinadmin"
windows_os_disk_caching           = "ReadWrite"
windows_os_disk_storage_type      = "StandardSSD_LRS"
windows_os_disk_size_gb           = 128
windows_image_publisher           = "MicrosoftWindowsServer"
windows_image_offer               = "WindowsServer"
windows_image_sku                 = "2022-datacenter-azure-edition"
windows_image_version             = "latest"
windows_data_disk_count           = 0
windows_data_disk_size_gb         = 32
windows_data_disk_storage_type    = "StandardSSD_LRS"
windows_data_disk_caching         = "ReadWrite"

# Load balancer (continues to target Linux NIC).
load_balancer_name           = "azure-lb-01"
load_balancer_public_ip_name = "azure-lb-pip-01"
lb_frontend_name             = "azure-lb-frontend"
lb_backend_pool_name         = "azure-lb-backend-pool"
lb_probe_name                = "azure-lb-probe"
lb_rule_name                 = "azure-lb-rule"
lb_outbound_rule_name        = "azure-lb-outbound"
lb_frontend_port             = 80
lb_backend_port              = 80
lb_probe_path                = "/"
lb_probe_interval            = 15
lb_probe_count               = 2
lb_outbound_ports            = 1024

security_rules = [
  {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  {
    name                       = "allow-azure-probes"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
  }
]

tags = {
  environment = "lab"
  managed_by  = "terraform"
}
