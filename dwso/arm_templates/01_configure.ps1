# 1
Connect-AzAccount
# 2
Set-AzContext developer_subscription
# 3
New-AzResourceGroup `
  -Name rg_etl `
  -Location "West Europe"
# 4
  New-AzResourceGroupDeployment `
    -Name 'new-storage-deployment' `
    -ResourceGroupName rg_etl_2 `
    -TemplateFile '02_storage_account_template.json'

