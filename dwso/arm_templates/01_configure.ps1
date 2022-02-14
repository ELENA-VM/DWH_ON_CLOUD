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
# 6
New-AzResourceGroupDeployment `
-Name 'new-data-factory-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '04_data_factory_template.json'
# 7
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-sa-retail-part-1-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '05_sa_retail_pipeline_part_1_template.json'
# 8
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-sa-retail-part-2-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '06_sa_retail_pipeline_part_2_template.json'
# 9
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-sa-stock-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '07_sa_stock_pipeline_template.json'
# 10
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-bl-3nf-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '08_bl_3nf_pipeline_template.json'
# 11
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-bl-dm-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '09_bl_dm_pipeline_template.json'
# 12
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-move-blob-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '10_move_blob_pipeline_template.json'
# 13
New-AzResourceGroupDeployment `
-Name 'new-data-factory-pipeline-etl-load-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '11_load_etl_template.json'


# 14
New-AzResourceGroupDeployment `
-Name 'new-logic-app-deployment' `
-ResourceGroupName rg_etl `
-TemplateFile '11_logic_app_template.json'