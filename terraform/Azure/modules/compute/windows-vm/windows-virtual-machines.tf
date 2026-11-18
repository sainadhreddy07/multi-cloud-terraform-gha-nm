resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.nsg_id
}

resource "azurerm_windows_virtual_machine" "this" {
  depends_on = [
    azurerm_network_interface_security_group_association.this
  ]

  name                = var.vm_name
  computer_name       = substr(var.vm_name, 0, 15)
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  provision_vm_agent = true
  patch_mode         = "AutomaticByOS"

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "data" {
  count = var.data_disk_count

  name                 = "${var.vm_name}-data-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_storage_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size_gb

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  count = var.data_disk_count

  managed_disk_id    = azurerm_managed_disk.data[count.index].id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  lun                = count.index
  caching            = var.data_disk_caching
}