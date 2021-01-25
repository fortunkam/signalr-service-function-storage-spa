resource "azurerm_signalr_service" "signalr" {
  name                = local.signalr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_S1"
    capacity = 1
  }

  cors {
    allowed_origins = ["https://${azurerm_storage_account.spa_storage.primary_web_host}"]
  }

  features {
    flag  = "ServiceMode"
    value = "Serverless"
  }
  features {
    flag  = "EnableConnectivityLogs"
    value = "true"
  }
  features {
    flag  = "EnableMessagingLogs"
    value = "true"
  }
}