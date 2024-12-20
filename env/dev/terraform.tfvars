rgs = {
  rg1 = {
    rg_name  = "dev-rg2"
    location = "west europe"
    tags = {
      environment = "dev"
    }
} }

vnets = {
  vnet1 = {
    vnet_name     = "dev-vnet01"
    location      = "west europe"
    rg_name       = "dev-rg2"
    address_space = ["10.0.0.0/16"] #["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
  }
}
subnets = {
  subnet1 = {
    subnet_name          = "dev-subnet1"
    resource_group_name  = "dev-rg2"
    virtual_network_name = "dev-vnet01"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet3 = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "dev-rg2"
    virtual_network_name = "dev-vnet01"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

nic = {
  nic1 = {
    nic_name             = "internal"
    location             = "west europe"
    resource_group_name  = "dev-rg2"
    virtual_network_name = "dev-vnet01"
    subnet_name          = "dev-subnet1"
    pip_name             = "devpip-1"
  }
}

linux_vms = {
  vm1 = {
    vm_name                = "dev-vm1"
    resource_group_name    = "dev-rg2"
    location               = "west europe"
    size                   = "Standard_B2s"
    admin_username         = "bipink"
    admin_password         = "rjio@1234567"
    network_interface_name = "internal"
  }
}

keyvault = {
  keyvault1 = {
    keyvault_name       = "devkvbipin01"
    location            = "west europe"
    resource_group_name = "dev-rg2"
  }
}

pip = {
  pip1 = {
    pip_name            = "devpip-1"
    location            = "west europe"
    resource_group_name = "dev-rg2"
  }
}

# bastion_host = {
#   bastion1 = {
#     bastion_name         = "devbastion123"
#     location             = "west europe"
#     resource_group_name  = "dev-rg2"
#     bastion_subnet_name  = "AzureBastionSubnet"
#     virtual_network_name = "dev-vnet01"
#     pip_name             = "devpip-1"

#   }
# }

sqlserver = {
  server1 = {
    server_name                  = "bipinserver4321"
    resource_group_name          = "dev-rg2"
    location                     = "central india"
    administrator_login          = "bipink1234"
    administrator_login_password = "rjio@123456789"
    sqldb_name                   = "bipinkdbexample"
    sqlserver_name               = "bipinserver4321"
  }
}

