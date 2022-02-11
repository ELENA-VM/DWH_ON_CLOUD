# 1
Connect-AzAccount -TenantId 31d5d017-6cc6-4bdc-9602-c478b2576cc2
# 2
Set-AzContext developer_subscription
# 3
New-AzResourceGroup `
  -Name rg_etl `
  -Location "West Europe"
# 4
  New-AzResourceGroupDeployment `
    -Name 'new-storage-deployment' `
    -ResourceGroupName rg_etl `
    -TemplateFile '02_storage_account_template.json'
# 5
  New-AzResourceGroupDeployment `
  -Name 'new-sql-server-deployment' `
  -ResourceGroupName rg_etl `
  -TemplateFile '03_sql_server_template.json'

