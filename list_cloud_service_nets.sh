group=${resourceGroup:-enea-rdmwa45-precert-rg-1}
az resource list  -g  ${group}  --resource-type Microsoft.NetworkCloud/cloudServicesNetworks | jq -r .[].id
