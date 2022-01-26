# Connect-AzAccount
# Get-AzSubscription
# $context = Get-AzSubscription -SubscriptionId {Your subscription ID}
# Set-AzContext $context

# create resource group
New-AzResourceGroup `
  -Name RG_ETL `
  -Location "West Europe"

# Set-AzDefault -ResourceGroupName [sandbox resource group name]