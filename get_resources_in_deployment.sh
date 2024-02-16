deployment=$1
group=${resourceGroup:-enea-rdmwa45-precert-rg-1}

az deployment group  show -g ${group} -n $1 | jq -r .properties.outputResources[].id | sed 's#.*/##g'
