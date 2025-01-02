variable "rgs" {
  
}


module "rgs" {
  source = "../../module/rg"
  rgs    = var.rgs
}