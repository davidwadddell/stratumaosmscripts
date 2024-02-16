THISDIR=$(dirname $(readlink -f $0))
deployment=$1
group=${resourceGroup:-enea-rdmwa45-precert-rg-1}
ids=$(az deployment group  show -g ${group} -n $1 | jq -r .properties.outputResources[].id ) 
for r in ${ids} ; do
 echo deleting ${r}
 az resource delete --ids ${r}
done
