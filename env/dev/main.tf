module "rgs" {
  source = "../../module/rg"
  rgs    = var.rgs
}

module "vnets" {
  source     = "../../module/vnet"
  vnets      = var.vnets
  depends_on = [module.rgs]
}

module "subnets" {
  source     = "../../module/subnet"
  subnets    = var.subnets
  depends_on = [module.vnets]
}

module "nic" {
  source     = "../../module/nic"
  nic        = var.nic
  depends_on = [module.subnets]
}

module "linux_vms" {
  source     = "../../module/vm"
  linux_vms  = var.linux_vms
  depends_on = [module.nic]
}

module "keyvault" {
  source     = "../../module/keyvault"
  keyvault   = var.keyvault
  depends_on = [module.rgs]
}

module "pip" {
  source     = "../../module/pip"
  pip        = var.pip
  depends_on = [module.nic]
}

module "bastion" {
  source       = "../../module/bastion"
  bastion_host = var.bastion_host
  depends_on   = [module.pip]
}

module "sqldb" {
  source     = "../../module/database"
  sqlserver  = var.sqlserver
  depends_on = [module.rgs]
}
