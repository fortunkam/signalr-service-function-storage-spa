variable location {
  default = "uksouth"
}
variable prefix {
  default = "sigr"
}


locals {
  rg_name               = "${var.prefix}"
  app_service_plan_name = "${var.prefix}-plan"
  function_name         = "${var.prefix}-function"
  app_insights_name     = "${var.prefix}-insights"
  signalr_name          = "${var.prefix}-signalr"
}

resource "random_id" "func_storage_name" {
  keepers = {
    resource_group = azurerm_resource_group.rg.name
  }
  byte_length = 8
}

resource "random_id" "spa_storage_name" {
  keepers = {
    resource_group = azurerm_resource_group.rg.name
  }
  byte_length = 8
}
