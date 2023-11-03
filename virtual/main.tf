resource "azurerm_resource_group" "vmrgjr" {
  name     = "vmrgjr"
  location = "East US"
}

locals {
  virtual_network={
    name = "vmjr-network"
    address_space="10.0.0.0/16"
  }
}

resource "azurerm_virtual_network" "vmjr-network" {
  name                = local.virtual_network.name
  location            = azurerm_resource_group.vmrgjr.location
  resource_group_name = azurerm_resource_group.vmrgjr.name
  address_space       = [local.virtual_network.address_space]
 
}

resource "azurerm_subnet" "subnetA" {
  name                 = "subnetA"
  resource_group_name  = azurerm_resource_group.vmrgjr.name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [ azurerm_virtual_network.vmjr-network ]

}

resource "azurerm_subnet" "subnetB" {
  name                 = "subnetC"
  resource_group_name  = azurerm_resource_group.vmrgjr.name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [ azurerm_virtual_network.vmjr-network ]

}

resource "azurerm_network_interface" "vmjr-interface" {
  name                = "vmjr-interface"
  location            = azurerm_resource_group.vmrgjr.location
  resource_group_name = azurerm_resource_group.vmrgjr.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vmjr-ip.id
  }
  depends_on = [ 
    azurerm_subnet.subnetA
   ]
}

resource "azurerm_public_ip" "vmjr-ip" {
  name                    = "vmjr-ip"
  location                = azurerm_resource_group.vmrgjr.location
  resource_group_name     = azurerm_resource_group.vmrgjr.name
  allocation_method       = "Static"
  depends_on = [ azurerm_resource_group.vmrgjr ]

  
}


resource "azurerm_network_security_group" "vmjr-sg" {
  name                = "vmjr-sg"
  location            = azurerm_resource_group.vmrgjr.location
  resource_group_name = azurerm_resource_group.vmrgjr.name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [ azurerm_resource_group.vmrgjr ]
}

resource "azurerm_subnet_network_security_group_association" "vmjr-as" {
  subnet_id                 = azurerm_subnet.subnetA.id
  network_security_group_id = azurerm_network_security_group.vmjr-sg.id
}

resource "azurerm_windows_virtual_machine" "vmjr-win" {
  name                = "vmjr-win"
  resource_group_name = azurerm_resource_group.vmrgjr.name
  location            = azurerm_resource_group.vmrgjr.location
  size                = lookup(var.instace_size, terraform.workspace)  # cambiar por entorno default, qa: Standard_E2S_V3, pro: Standard_D4S_V3
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vmjr-interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

variable "instace_size" {
    type = map

    default = {
        default = "Standard_D2S_V3"
        qa = "Standard_E2S_V3"
        prod = "Standard_D4S_V3"
    }
  
}
