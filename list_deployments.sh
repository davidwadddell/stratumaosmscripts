deployment=$1
group=${resourceGroup:-enea-rdmwa45-precert-rg-1}

az deployment group list  -g ${group}  -o table
